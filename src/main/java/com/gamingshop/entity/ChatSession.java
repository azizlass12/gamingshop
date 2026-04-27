package com.gamingshop.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "chat_session")
@Data
@NoArgsConstructor
public class ChatSession {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "client_name", nullable = false)
    private String clientName;

    @Column(name = "client_phone", nullable = false)
    private String clientPhone;

    @Enumerated(EnumType.STRING)
    private SessionStatus status = SessionStatus.PENDING;

    @Column(name = "is_read_by_admin")
    private Boolean isReadByAdmin = false;

    @OneToMany(mappedBy = "session", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<ChatOrderItem> orderItems;

    @OneToMany(mappedBy = "session", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<ChatMessage> messages;

    @Column(name = "created_at")
    private LocalDateTime createdAt = LocalDateTime.now();

    @Column(name = "updated_at")
    private LocalDateTime updatedAt = LocalDateTime.now();

    @PreUpdate
    public void preUpdate() {
        this.updatedAt = LocalDateTime.now();
    }

    public enum SessionStatus {
        PENDING, ACTIVE, CLOSED
    }
}