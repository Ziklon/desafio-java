package org.darkbit.service;

import lombok.RequiredArgsConstructor;
import org.darkbit.dto.MetricsDto;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MetricsService {

  private final JedisPool jedisPool;

  public List<MetricsDto> findMetrics(String prefix) {
    try (Jedis jedis = jedisPool.getResource()) {
      return jedis.keys(prefix + "*").stream()
              .map(key -> new MetricsDto(key, Long.valueOf(jedis.get(key))))
              .toList();
    }
  }
}
