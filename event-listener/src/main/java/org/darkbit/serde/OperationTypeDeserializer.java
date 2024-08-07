package org.darkbit.serde;

import com.fasterxml.jackson.core.JacksonException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import org.darkbit.dto.DebeziumEventDto;

import java.io.IOException;

public class OperationTypeDeserializer extends JsonDeserializer<DebeziumEventDto.OperationType> {

  @Override
  public DebeziumEventDto.OperationType deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JacksonException {
    return DebeziumEventDto.OperationType.fromCode(jsonParser.getValueAsString());
  }
}
