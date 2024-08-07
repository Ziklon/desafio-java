package org.darkbit.product.service;

import lombok.RequiredArgsConstructor;
import org.darkbit.product.dto.ProductDto;
import org.darkbit.product.entity.Product;
import org.darkbit.product.exception.NotFoundException;
import org.darkbit.product.mapper.EntityMapper;
import org.darkbit.product.repository.ProductRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.Instant;

@Service
@RequiredArgsConstructor
public class ProductService {

  private final ProductRepository productRepository;
  private final EntityMapper entityMapper;

  public ProductDto save(ProductDto product) {
    var entity = entityMapper.toProduct(product).withUpdatedAt(Instant.now());
    return entityMapper.fromProduct(productRepository.save(entity));
  }

  public ProductDto findById(Long id) {
    return productRepository.findById(id)
            .map(entityMapper::fromProduct)
            .orElseThrow(NotFoundException::new);
  }

  public void update(ProductDto product) {

    var existing = findById(product.getId());//throws an error in case not exists;

    var entity = entityMapper.toProduct(product)
            .toBuilder()
            .id(existing.getId())
            .createdAt(existing.getCreatedAt())
            .updatedAt(Instant.now())
            .build();

    entityMapper.fromProduct(productRepository.save(entity));
  }

  public Page<ProductDto> findAll(String title, Pageable pageable) {
    Page<Product> records;
    if (title == null || title.isBlank()) {
      records = productRepository.findAll(pageable);
    } else {
      records = productRepository.findByTitleContaining(title, pageable);
    }
    return records.map(entityMapper::fromProduct);
  }

  public void deleteById(Long id) {
    findById(id);//throws an error in case not exists;
    productRepository.deleteById(id);
  }
}
