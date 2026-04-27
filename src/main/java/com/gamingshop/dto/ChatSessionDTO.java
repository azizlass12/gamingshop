package com.gamingshop.dto;

import lombok.Data;
import java.time.LocalDateTime;
import java.util.List;

@Data
public class ChatSessionDTO {
    private Long id;
    private String clientName;
    private String clientPhone;
    private String status;
    private Boolean isReadByAdmin;
    private List<OrderItemDTO> orderItems;
    private List<MessageDTO> messages;
    private LocalDateTime createdAt;
    private Long unreadCount;

    @Data
    public static class OrderItemDTO {
        private Long productId;
        private String productName;
        private Integer quantity;
        private Double unitPrice;
    }

    @Data
    public static class MessageDTO {
        private Long id;
        private String senderType;
        private String senderName;
        private String message;
        private Boolean isRead;
        private LocalDateTime sentAt;
    }
}