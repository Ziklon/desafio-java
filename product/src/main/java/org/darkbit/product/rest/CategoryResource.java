package org.darkbit.product.rest;

import lombok.RequiredArgsConstructor;
import org.darkbit.product.entity.Category;
import org.darkbit.product.service.CategoryService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/category")
@RequiredArgsConstructor
public class CategoryResource {
  private final CategoryService categoryService;

  @GetMapping
  public Page<Category> getCategories(Pageable pageable) {
    return categoryService.findAll(pageable);
  }

  @GetMapping("{id}")
  public Category getCategory(@PathVariable Long id) {
    return categoryService.findById(id);
  }
}
