package com.gamingshop.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "product")
@Data
@NoArgsConstructor
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(columnDefinition = "TEXT")
    private String description;

    @Column(nullable = false)
    private BigDecimal price;

    private Integer stock = 0;

    @Column(name = "image_url")
    private String imageUrl;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id")
    private Category category;

    // ===== NOUVEAUX CHAMPS =====

    // Régions disponibles (ex: "Global,EU,US,TR")
    @Column(name = "regions", columnDefinition = "TEXT")
    private String regions;

    // Valeurs disponibles (ex: "10$,20$,50$,100$")
    @Column(name = "values_available", columnDefinition = "TEXT")
    private String valuesAvailable;

    // Prix par valeur en JSON (ex: {"10$":32,"20$":62,"50$":150})
    @Column(name = "prices_by_value", columnDefinition = "TEXT")
    private String pricesByValue;

    @Column(name = "created_at")
    private LocalDateTime createdAt = LocalDateTime.now();

    @Column(name = "updated_at")
    private LocalDateTime updatedAt = LocalDateTime.now();

    @PreUpdate
    public void preUpdate() {
        this.updatedAt = LocalDateTime.now();
    }
}