package org.darkbit.product.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;
import lombok.Value;

import java.time.Instant;

@Entity
@Table(name = "category")
@Value
@Builder
@AllArgsConstructor
@NoArgsConstructor(force = true)
public class Category {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  Long id;
  String name;

  Instant createdAt;
  Instant updatedAt;
}
