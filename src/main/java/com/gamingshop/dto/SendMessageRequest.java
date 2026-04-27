package com.gamingshop.dto;


import lombok.Data;

@Data
public class SendMessageRequest {
    private Long sessionId;
    private String message;
    private String senderType; // CLIENT or ADMIN
    private String senderName;
}

