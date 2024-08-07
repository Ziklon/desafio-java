package org.darkbit;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import org.darkbit.product.jackson.InstantSerializer;
import org.darkbit.product.jackson.PageSerializer;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import java.time.Instant;

@SpringBootApplication
@EnableJpaRepositories
public class ProductApplication {
  public static void main(String[] args) {
    SpringApplication.run(ProductApplication.class, args);
  }

  @Bean
  public ObjectMapper objectMapper() {
    ObjectMapper objectMapper = new ObjectMapper();
    SimpleModule simpleModule = new SimpleModule();
    simpleModule.addSerializer(Page.class, new PageSerializer());
    simpleModule.addSerializer(Instant.class, new InstantSerializer());
    objectMapper.registerModule(new JavaTimeModule());
    objectMapper.registerModule(simpleModule);
    return objectMapper;
  }
}