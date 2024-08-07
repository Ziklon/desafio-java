package org.darkbit.product.service;

import lombok.RequiredArgsConstructor;
import org.darkbit.product.entity.Category;
import org.darkbit.product.exception.NotFoundException;
import org.darkbit.product.repository.CategoryRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CategoryService {

  private final CategoryRepository categoryRepository;

  public Category save(Category category) {
    return categoryRepository.save(category);
  }

  public Category findById(Long id) {
    return categoryRepository.findById(id).orElseThrow(NotFoundException::new);
  }

  public Page<Category> findAll(Pageable pageable) {
    return categoryRepository.findAll(pageable);
  }
}
