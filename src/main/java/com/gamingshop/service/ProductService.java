package com.gamingshop.service;

import com.gamingshop.dto.ProductDTO;
import com.gamingshop.entity.Category;
import com.gamingshop.entity.Product;
import com.gamingshop.repository.CategoryRepository;
import com.gamingshop.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductRepository productRepository;
    private final CategoryRepository categoryRepository;

    public List<ProductDTO> getAllProducts() {
        return productRepository.findAll().stream()
                .map(this::toDTO).collect(Collectors.toList());
    }

    public List<ProductDTO> getProductsByCategory(Long categoryId) {
        return productRepository.findByCategoryId(categoryId).stream()
                .map(this::toDTO).collect(Collectors.toList());
    }

    public List<ProductDTO> searchProducts(String keyword) {
        return productRepository.searchByKeyword(keyword).stream()
                .map(this::toDTO).collect(Collectors.toList());
    }

    public ProductDTO getProductById(Long id) {
        Product p = productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found: " + id));
        return toDTO(p);
    }

    public ProductDTO createProduct(ProductDTO dto) {
        Product product = new Product();
        mapFromDTO(product, dto);
        return toDTO(productRepository.save(product));
    }

    public ProductDTO updateProduct(Long id, ProductDTO dto) {
        Product product = productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found: " + id));
        mapFromDTO(product, dto);
        return toDTO(productRepository.save(product));
    }

    public void deleteProduct(Long id) {
        productRepository.deleteById(id);
    }

    private void mapFromDTO(Product product, ProductDTO dto) {
        product.setName(dto.getName());
        product.setDescription(dto.getDescription());
        product.setPrice(dto.getPrice());
        product.setStock(dto.getStock());
        product.setImageUrl(dto.getImageUrl());
        // Nouveaux champs
        product.setRegions(dto.getRegions());
        product.setValuesAvailable(dto.getValuesAvailable());
        product.setPricesByValue(dto.getPricesByValue());
        if (dto.getCategoryId() != null) {
            Category category = categoryRepository.findById(dto.getCategoryId()).orElse(null);
            product.setCategory(category);
        }
    }

    public ProductDTO toDTO(Product p) {
        ProductDTO dto = new ProductDTO();
        dto.setId(p.getId());
        dto.setName(p.getName());
        dto.setDescription(p.getDescription());
        dto.setPrice(p.getPrice());
        dto.setStock(p.getStock());
        dto.setImageUrl(p.getImageUrl());
        dto.setRegions(p.getRegions());
        dto.setValuesAvailable(p.getValuesAvailable());
        dto.setPricesByValue(p.getPricesByValue());

        // Parse vers listes
        if (p.getRegions() != null && !p.getRegions().isBlank()) {
            dto.setRegionList(Arrays.asList(p.getRegions().split(",")));
        } else {
            dto.setRegionList(Collections.emptyList());
        }
        if (p.getValuesAvailable() != null && !p.getValuesAvailable().isBlank()) {
            dto.setValueList(Arrays.asList(p.getValuesAvailable().split(",")));
        } else {
            dto.setValueList(Collections.emptyList());
        }

        if (p.getCategory() != null) {
            dto.setCategoryId(p.getCategory().getId());
            dto.setCategoryName(p.getCategory().getName());
        }
        return dto;
    }
}