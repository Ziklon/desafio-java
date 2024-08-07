package org.darkbit.serde;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.kafka.common.serialization.Deserializer;
import org.darkbit.dto.DebeziumEventDto;

import java.io.IOException;

public class DebeziumEventDeserializer implements Deserializer<DebeziumEventDto> {
 private static final ObjectMapper mapper = new ObjectMapper();
  static {
    mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
  }

  @Override
  public DebeziumEventDto deserialize(String topic, byte[] data) {
    try {
      return mapper.readValue(data, DebeziumEventDto.class);
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }
}
