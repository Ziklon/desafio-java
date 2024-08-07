package org.darkbit.product.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.Instant;

@Data
@Builder(toBuilder = true)
@AllArgsConstructor
@NoArgsConstructor
public class ProductDto {
  Long id;
  String title;
  String description;
  Long category;
  BigDecimal price;
  BigDecimal rating;
  Integer stock;
  Instant createdAt;
  Instant updatedAt;

  public ProductDto withId(Long id) {
    return this.toBuilder().id(id).build();
  }
}
