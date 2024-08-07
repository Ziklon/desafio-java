package org.darkbit.product.rest;


import lombok.RequiredArgsConstructor;
import org.darkbit.product.dto.ProductDto;
import org.darkbit.product.service.ProductService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/product")
@RequiredArgsConstructor
public class ProductResource {

  private final ProductService productService;

  @GetMapping
  public Page<ProductDto> getProducts(@RequestParam(name = "title", required = false) String title,
                                      Pageable pageable) {
    return productService.findAll(title, pageable);
  }

  @PostMapping
  public ProductDto createProduct(@RequestBody ProductDto product) {
    return productService.save(product);
  }

  @GetMapping("{id}")
  public ProductDto getProduct(@PathVariable Long id) {
    return productService.findById(id);
  }

  @PutMapping("{id}")
  public void updateProduct(@PathVariable Long id, @RequestBody ProductDto product) {
    var updatedProduct = product.withId(id);
    productService.update(updatedProduct);
  }

  @DeleteMapping("{id}")
  public void deleteProduct(@PathVariable Long id) {
    productService.deleteById(id);
  }
}
