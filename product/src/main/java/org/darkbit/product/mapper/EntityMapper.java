package org.darkbit.product.mapper;

import lombok.RequiredArgsConstructor;
import org.darkbit.product.dto.ProductDto;
import org.darkbit.product.entity.Product;
import org.darkbit.product.exception.BadRequestException;
import org.darkbit.product.repository.CategoryRepository;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class EntityMapper {

  private final CategoryRepository categoryRepository;


  public Product toProduct(ProductDto product) {
    return Product.builder()
            .id(product.getId())
            .price(product.getPrice())
            .stock(product.getStock())
            .rating(product.getRating())
            .title(product.getTitle())
            .description(product.getDescription())
            .category(categoryRepository.findById(product.getCategory()).orElseThrow(BadRequestException::new))
            .build();
  }

  public ProductDto fromProduct(Product product) {
    return ProductDto.builder()
            .id(product.getId())
            .category(product.getCategory().getId())
            .description(product.getDescription())
            .title(product.getTitle())
            .price(product.getPrice())
            .rating(product.getRating())
            .stock(product.getStock())
            .createdAt(product.getCreatedAt())
            .updatedAt(product.getUpdatedAt())
            .build();
  }
}
