package org.darkbit.messasing;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.darkbit.dto.DebeziumEventDto;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@Slf4j
@Component
@RequiredArgsConstructor
public class ProductMessageListener {

  private final JedisPool jedisPool;

  @KafkaListener(id = "productConsumer", topics = "desafio.public.product")
  public void listen1(DebeziumEventDto message) {
    log.info("Received message {}", message);
    var operationType = message.getPayload().getOperationType();
    if (operationType == DebeziumEventDto.OperationType.UPDATE || operationType == DebeziumEventDto.OperationType.CREATE) {
      handleInsertAndUpdate(message.getPayload());
    }
  }

  private void handleInsertAndUpdate(DebeziumEventDto.Payload payload) {
    try (Jedis jedis = jedisPool.getResource()) {
      var categoryId = Integer.valueOf(payload.getAfter().get("category_id").toString());
      var operationName = payload.getOperationType().name().toLowerCase();
      var categoryKey = String.format("%s.category.%d", operationName, categoryId);
      log.info("received category key {}", categoryKey);
      jedis.incr(categoryKey);
    }
  }
}
