package org.darkbit.rest;

import lombok.RequiredArgsConstructor;
import org.darkbit.dto.MetricsDto;
import org.darkbit.service.MetricsService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1/metrics")
@RequiredArgsConstructor
public class MetricsController {

  private final MetricsService metricsService;

  @GetMapping
  public List<MetricsDto> getProducts(@RequestParam(name = "prefix") String prefix) {
    return metricsService.findMetrics(prefix);
  }
}
