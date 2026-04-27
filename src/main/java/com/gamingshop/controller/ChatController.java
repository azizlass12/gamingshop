package com.gamingshop.controller;

import com.gamingshop.dto.*;
import com.gamingshop.service.ChatService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/chat")
@RequiredArgsConstructor
public class ChatController {

    private final ChatService chatService;

    // ---- PUBLIC (CLIENT) ----

    @PostMapping("/session")
    public ResponseEntity<ApiResponse<ChatSessionDTO>> createSession(@RequestBody CreateSessionRequest request) {
        return ResponseEntity.ok(ApiResponse.success("Session created", chatService.createSession(request)));
    }

    @PostMapping("/message")
    public ResponseEntity<ApiResponse<ChatSessionDTO>> sendMessage(@RequestBody SendMessageRequest request) {
        return ResponseEntity.ok(ApiResponse.success(chatService.sendMessage(request)));
    }

    @GetMapping("/session/{id}/messages")
    public ResponseEntity<ApiResponse<ChatSessionDTO>> getSession(@PathVariable Long id) {
        return ResponseEntity.ok(ApiResponse.success(chatService.getSessionById(id)));
    }

    @GetMapping("/sessions/by-phone")
    public ResponseEntity<ApiResponse<List<ChatSessionDTO>>> getSessionsByPhone(
            @RequestParam String clientPhone) {
        return ResponseEntity.ok(ApiResponse.success(chatService.getSessionsByPhone(clientPhone)));
    }

    // =========================================================
    // NOUVEAU : Mes commandes pour le client connecté
    // Le token JWT est validé automatiquement par JwtAuthFilter.
    // Spring injecte l'Authentication avec le username extrait du token.
    // =========================================================
    @GetMapping("/my-sessions")
    public ResponseEntity<ApiResponse<List<ChatSessionDTO>>> getMySessions(Authentication authentication) {
        // authentication.getName() = username extrait du JWT
        String username = authentication.getName();
        List<ChatSessionDTO> sessions = chatService.getMySessionsByUsername(username);
        return ResponseEntity.ok(ApiResponse.success(sessions));
    }

    // ---- ADMIN ONLY ----

    @GetMapping("/admin/sessions")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<List<ChatSessionDTO>>> getAllSessions() {
        return ResponseEntity.ok(ApiResponse.success(chatService.getAllSessions()));
    }

    @GetMapping("/admin/unread-count")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Map<String, Long>>> getUnreadCount() {
        return ResponseEntity.ok(ApiResponse.success(Map.of("count", chatService.getUnreadCount())));
    }

    @PostMapping("/admin/session/{id}/read")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Void>> markAsRead(@PathVariable Long id) {
        chatService.markSessionAsRead(id);
        return ResponseEntity.ok(ApiResponse.success("Marked as read", null));
    }

    @PostMapping("/admin/session/{id}/close")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Void>> closeSession(@PathVariable Long id) {
        chatService.closeSession(id);
        return ResponseEntity.ok(ApiResponse.success("Session closed", null));
    }
}