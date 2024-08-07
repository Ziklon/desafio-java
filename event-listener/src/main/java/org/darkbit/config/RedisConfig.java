package org.darkbit.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

@Configuration
public class RedisConfig {

  @Bean
  public JedisPool jedisPool() {
    var config = new JedisPoolConfig();
    config.setJmxEnabled(false);
    return new JedisPool(config, "localhost", 6379, "default", "secret");
  }

}
