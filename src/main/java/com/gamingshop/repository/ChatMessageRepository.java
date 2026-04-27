package com.gamingshop.repository;

import com.gamingshop.entity.ChatMessage;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface ChatMessageRepository extends JpaRepository<ChatMessage, Long> {
    List<ChatMessage> findBySessionIdOrderBySentAtAsc(Long sessionId);
    Long countBySessionIdAndIsReadFalseAndSenderTypeNot(Long sessionId, ChatMessage.SenderType senderType);
}