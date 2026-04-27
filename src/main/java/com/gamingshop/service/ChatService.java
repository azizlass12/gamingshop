package com.gamingshop.service;

import com.gamingshop.dto.ChatSessionDTO;
import com.gamingshop.dto.CreateSessionRequest;
import com.gamingshop.dto.SendMessageRequest;
import com.gamingshop.entity.*;
import com.gamingshop.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ChatService {

    private final ChatSessionRepository sessionRepository;
    private final ChatMessageRepository messageRepository;
    private final ProductRepository productRepository;
    private final SimpMessagingTemplate messagingTemplate;

    @Transactional
    public ChatSessionDTO createSession(CreateSessionRequest request) {
        ChatSession session = new ChatSession();
        session.setClientName(request.getClientName());
        session.setClientPhone(request.getClientPhone());
        session.setStatus(ChatSession.SessionStatus.PENDING);
        session.setIsReadByAdmin(false);
        session = sessionRepository.save(session);

        final Long sessionId = session.getId();
        ChatSession finalSession = session;

        if (request.getItems() != null) {
            for (CreateSessionRequest.OrderItemRequest item : request.getItems()) {
                ChatOrderItem orderItem = new ChatOrderItem();
                orderItem.setSession(finalSession);
                Product product = productRepository.findById(item.getProductId()).orElse(null);
                orderItem.setProduct(product);
                orderItem.setProductName(item.getProductName());
                orderItem.setQuantity(item.getQuantity());
                orderItem.setUnitPrice(java.math.BigDecimal.valueOf(item.getUnitPrice()));
            }
        }

        String orderSummary = buildOrderSummary(request);
        ChatMessage autoMsg = new ChatMessage();
        autoMsg.setSession(finalSession);
        autoMsg.setSenderType(ChatMessage.SenderType.CLIENT);
        autoMsg.setSenderName(request.getClientName());
        autoMsg.setMessage(orderSummary);
        autoMsg.setIsRead(false);
        messageRepository.save(autoMsg);

        messagingTemplate.convertAndSend("/topic/admin/notifications",
                Map.of("type", "NEW_SESSION", "sessionId", sessionId,
                        "clientName", request.getClientName(), "phone", request.getClientPhone()));

        return getSessionById(sessionId);
    }

    private String buildOrderSummary(CreateSessionRequest request) {
        StringBuilder sb = new StringBuilder();
        sb.append("Bonjour, je suis ").append(request.getClientName());
        sb.append(" (").append(request.getClientPhone()).append("). Je voudrais commander:\n");
        if (request.getItems() != null) {
            for (CreateSessionRequest.OrderItemRequest item : request.getItems()) {
                sb.append("• ").append(item.getProductName())
                        .append(" × ").append(item.getQuantity())
                        .append(" — ").append(String.format("%.2f", item.getUnitPrice() * item.getQuantity())).append(" DA\n");
            }
        }
        sb.append("\nComment puis-je payer ?");
        return sb.toString();
    }

    @Transactional
    public ChatSessionDTO sendMessage(SendMessageRequest request) {
        ChatSession session = sessionRepository.findById(request.getSessionId())
                .orElseThrow(() -> new RuntimeException("Session not found"));

        ChatMessage message = new ChatMessage();
        message.setSession(session);
        message.setSenderType(ChatMessage.SenderType.valueOf(request.getSenderType()));
        message.setSenderName(request.getSenderName());
        message.setMessage(request.getMessage());
        message.setIsRead(false);
        messageRepository.save(message);

        if (session.getStatus() == ChatSession.SessionStatus.PENDING) {
            session.setStatus(ChatSession.SessionStatus.ACTIVE);
            sessionRepository.save(session);
        }

        ChatSessionDTO.MessageDTO msgDTO = new ChatSessionDTO.MessageDTO();
        msgDTO.setSenderType(request.getSenderType());
        msgDTO.setSenderName(request.getSenderName());
        msgDTO.setMessage(request.getMessage());
        msgDTO.setSentAt(java.time.LocalDateTime.now());

        messagingTemplate.convertAndSend("/topic/chat/" + request.getSessionId(), msgDTO);

        if ("CLIENT".equals(request.getSenderType())) {
            session.setIsReadByAdmin(false);
            sessionRepository.save(session);
            messagingTemplate.convertAndSend("/topic/admin/notifications",
                    Map.of("type", "NEW_MESSAGE", "sessionId", request.getSessionId(),
                            "senderName", request.getSenderName(), "message", request.getMessage()));
        }

        return getSessionById(request.getSessionId());
    }

    public ChatSessionDTO getSessionById(Long id) {
        ChatSession session = sessionRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Session not found"));
        return toDTO(session);
    }

    public List<ChatSessionDTO> getAllSessions() {
        return sessionRepository.findByOrderByCreatedAtDesc().stream()
                .map(this::toDTO)
                .collect(Collectors.toList());
    }

    public Long getUnreadCount() {
        return sessionRepository.countUnreadSessions();
    }

    @Transactional
    public void markSessionAsRead(Long sessionId) {
        ChatSession session = sessionRepository.findById(sessionId)
                .orElseThrow(() -> new RuntimeException("Session not found"));
        session.setIsReadByAdmin(true);
        sessionRepository.save(session);

        List<ChatMessage> messages = messageRepository.findBySessionIdOrderBySentAtAsc(sessionId);
        messages.forEach(m -> m.setIsRead(true));
        messageRepository.saveAll(messages);
    }

    @Transactional
    public void closeSession(Long sessionId) {
        ChatSession session = sessionRepository.findById(sessionId)
                .orElseThrow(() -> new RuntimeException("Session not found"));
        session.setStatus(ChatSession.SessionStatus.CLOSED);
        sessionRepository.save(session);
        messagingTemplate.convertAndSend("/topic/chat/" + sessionId,
                Map.of("type", "SESSION_CLOSED"));
    }

    public List<ChatSessionDTO> getSessionsByPhone(String clientPhone) {
        return sessionRepository.findByClientPhoneOrderByCreatedAtDesc(clientPhone)
                .stream()
                .map(this::toDTO)
                .collect(Collectors.toList());
    }

    // =========================================================
    // NOUVEAU : récupérer les sessions du client connecté
    // Le clientName = username stocké dans le JWT
    // =========================================================
    public List<ChatSessionDTO> getMySessionsByUsername(String username) {
        return sessionRepository.findByClientNameOrderByCreatedAtDesc(username)
                .stream()
                .map(this::toDTO)
                .collect(Collectors.toList());
    }

    private ChatSessionDTO toDTO(ChatSession session) {
        ChatSessionDTO dto = new ChatSessionDTO();
        dto.setId(session.getId());
        dto.setClientName(session.getClientName());
        dto.setClientPhone(session.getClientPhone());
        dto.setStatus(session.getStatus().name());
        dto.setIsReadByAdmin(session.getIsReadByAdmin());
        dto.setCreatedAt(session.getCreatedAt());

        List<ChatMessage> messages = messageRepository.findBySessionIdOrderBySentAtAsc(session.getId());
        dto.setMessages(messages.stream().map(m -> {
            ChatSessionDTO.MessageDTO msg = new ChatSessionDTO.MessageDTO();
            msg.setId(m.getId());
            msg.setSenderType(m.getSenderType().name());
            msg.setSenderName(m.getSenderName());
            msg.setMessage(m.getMessage());
            msg.setIsRead(m.getIsRead());
            msg.setSentAt(m.getSentAt());
            return msg;
        }).collect(Collectors.toList()));

        Long unread = messageRepository.countBySessionIdAndIsReadFalseAndSenderTypeNot(
                session.getId(), ChatMessage.SenderType.ADMIN);
        dto.setUnreadCount(unread);

        return dto;
    }
}