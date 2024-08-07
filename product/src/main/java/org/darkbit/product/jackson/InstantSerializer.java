package org.darkbit.product.jackson;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

import java.io.IOException;
import java.time.Instant;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;

public class InstantSerializer extends JsonSerializer<Instant> {
  private static final String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss.SSS";
  DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern(DATE_FORMAT).withZone(ZoneOffset.UTC);

  @Override
  public void serialize(Instant instant, JsonGenerator json, SerializerProvider serializerProvider) throws IOException {
    json.writeString(FORMATTER.format(instant));
  }
}
