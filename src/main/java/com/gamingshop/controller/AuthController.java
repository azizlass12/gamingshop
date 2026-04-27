package com.gamingshop.controller;


import com.gamingshop.entity.Role;
import com.gamingshop.entity.User;
import com.gamingshop.dto.ApiResponse;
import com.gamingshop.dto.AuthRequest;
import com.gamingshop.dto.AuthResponse;
import com.gamingshop.security.JwtUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;
import com.gamingshop.repository.UserRepository;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AuthenticationManager authenticationManager;
    private final JwtUtil jwtUtil;
    private final PasswordEncoder passwordEncoder;
    private final UserRepository adminRepository;

    @PostMapping("/login")
    public ResponseEntity<ApiResponse<AuthResponse>> login(@RequestBody AuthRequest request) {
        try {
            // LOG : vérifie ce qui est en base

            System.out.println("Nouveau hash: " + passwordEncoder.encode("admin123"));

            adminRepository.findByUsername(request.getUsername()).ifPresentOrElse(
                    admin -> {
                        System.out.println("=== DEBUG ===");
                        System.out.println("Username trouvé: " + admin.getUsername());
                        System.out.println("Hash en base: " + admin.getPassword());
                        System.out.println("Password reçu: " + request.getPassword());
                        System.out.println("Match BCrypt: " + passwordEncoder.matches(request.getPassword(), admin.getPassword()));
                        System.out.println("=============");
                    },
                    () -> System.out.println("=== USER NON TROUVÉ: " + request.getUsername() + " ===")
            );

            Authentication auth = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(request.getUsername(), request.getPassword())
            );
            String token = jwtUtil.generateToken(request.getUsername());
            AuthResponse response = new AuthResponse(token, request.getUsername(), "Login successful");
            return ResponseEntity.ok(ApiResponse.success("Login successful", response));
        } catch (BadCredentialsException e) {
            return ResponseEntity.status(401).body(ApiResponse.error("Invalid username or password"));
        }
    }
    @PostMapping("/register")
    public ResponseEntity<ApiResponse<String>> register(@RequestBody AuthRequest request) {

        if (adminRepository.findByUsername(request.getUsername()).isPresent()) {
            return ResponseEntity.badRequest().body(ApiResponse.error("Username already exists"));
        }

        User user = new User();
        user.setUsername(request.getUsername());
        user.setPassword(passwordEncoder.encode(request.getPassword()));
        user.setRole(Role.CLIENT); // 🔥 toujours client

        adminRepository.save(user);

        return ResponseEntity.ok(ApiResponse.success("User registered successfully", "OK"));
    }
}