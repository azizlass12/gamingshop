package com.gamingshop.controller;

import com.gamingshop.dto.ApiResponse;
import com.gamingshop.dto.ProductDTO;
import com.gamingshop.entity.Category;
import com.gamingshop.repository.CategoryRepository;
import com.gamingshop.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class ProductController {

    private final ProductService productService;
    private final CategoryRepository categoryRepository;

    // ── PUBLIC ────────────────────────────────────────────────

    @GetMapping("/products")
    public ResponseEntity<ApiResponse<List<ProductDTO>>> getAllProducts(
            @RequestParam(required = false) Long categoryId,
            @RequestParam(required = false) String search) {
        List<ProductDTO> products;
        if (categoryId != null)                  { products = productService.getProductsByCategory(categoryId); }
        else if (search != null && !search.isEmpty()) { products = productService.searchProducts(search); }
        else                                     { products = productService.getAllProducts(); }
        return ResponseEntity.ok(ApiResponse.success(products));
    }

    @GetMapping("/products/{id}")
    public ResponseEntity<ApiResponse<ProductDTO>> getProduct(@PathVariable Long id) {
        return ResponseEntity.ok(ApiResponse.success(productService.getProductById(id)));
    }

    @GetMapping("/categories")
    public ResponseEntity<ApiResponse<List<Category>>> getCategories() {
        return ResponseEntity.ok(ApiResponse.success(categoryRepository.findAll()));
    }

    // ── ADMIN PRODUCTS ────────────────────────────────────────

    @PostMapping("/admin/products")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<ProductDTO>> createProduct(@RequestBody ProductDTO dto) {
        return ResponseEntity.ok(ApiResponse.success("Product created", productService.createProduct(dto)));
    }

    @PutMapping("/admin/products/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<ProductDTO>> updateProduct(@PathVariable Long id, @RequestBody ProductDTO dto) {
        return ResponseEntity.ok(ApiResponse.success("Product updated", productService.updateProduct(id, dto)));
    }

    @DeleteMapping("/admin/products/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Void>> deleteProduct(@PathVariable Long id) {
        productService.deleteProduct(id);
        return ResponseEntity.ok(ApiResponse.success("Product deleted", null));
    }

    // ── ADMIN CATEGORIES ──────────────────────────────────────

    @PostMapping("/admin/categories")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Category>> createCategory(@RequestBody Category category) {
        Category saved = categoryRepository.save(category);
        return ResponseEntity.ok(ApiResponse.success("Category created", saved));
    }

    @PutMapping("/admin/categories/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Category>> updateCategory(
            @PathVariable Long id, @RequestBody Category category) {
        return categoryRepository.findById(id).map(existing -> {
            existing.setName(category.getName());
            existing.setDescription(category.getDescription());
            existing.setIcon(category.getIcon());
            Category saved = categoryRepository.save(existing);
            return ResponseEntity.ok(ApiResponse.success("Category updated", saved));
        }).orElse(ResponseEntity.notFound().<ApiResponse<Category>>build());
    }

    @DeleteMapping("/admin/categories/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Void>> deleteCategory(@PathVariable Long id) {
        if (!categoryRepository.existsById(id)) {
            return ResponseEntity.notFound().<ApiResponse<Void>>build();
        }
        categoryRepository.deleteById(id);
        return ResponseEntity.ok(ApiResponse.success("Category deleted", null));
    }
}