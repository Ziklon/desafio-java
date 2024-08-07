package org.darkbit.product.entity;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;
import lombok.Value;

import java.math.BigDecimal;
import java.time.Instant;

@Entity
@Table(name = "product")
@Value
@Builder(toBuilder = true)
@AllArgsConstructor
@NoArgsConstructor(force = true)
public class Product {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  Long id;

  String title;

  String description;
  @ManyToOne(fetch = FetchType.EAGER)
  @JoinColumn(name = "category_id", nullable = false)
  Category category;
  BigDecimal price;
  BigDecimal rating;
  Integer stock;
  @Builder.Default
  Instant createdAt = Instant.now();
  Instant updatedAt;

  public Product withId(Long id) {
    return this.toBuilder().id(id).build();
  }

  public Product withUpdatedAt(Instant updatedAt) {
    return this.toBuilder().updatedAt(updatedAt).build();
  }
}
