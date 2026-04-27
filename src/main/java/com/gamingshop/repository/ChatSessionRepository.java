package com.gamingshop.repository;

import com.gamingshop.entity.ChatSession;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.util.List;

public interface ChatSessionRepository extends JpaRepository<ChatSession, Long> {

    List<ChatSession> findByOrderByCreatedAtDesc();

    @Query("SELECT COUNT(s) FROM ChatSession s WHERE s.isReadByAdmin = false AND s.status = 'PENDING'")
    Long countUnreadSessions();

    List<ChatSession> findByIsReadByAdminFalseOrderByCreatedAtDesc();

    List<ChatSession> findByClientPhoneOrderByCreatedAtDesc(String clientPhone);

    // ← NOUVEAU : chercher par nom du client (= username du compte)
    List<ChatSession> findByClientNameOrderByCreatedAtDesc(String clientName);
}