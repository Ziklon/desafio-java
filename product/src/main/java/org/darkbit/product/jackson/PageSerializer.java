package org.darkbit.product.jackson;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import org.springframework.data.domain.Page;

import java.io.IOException;

public class PageSerializer extends JsonSerializer<Page> {

  @Override
  public void serialize(Page page, JsonGenerator jgen, SerializerProvider serializerProvider) throws IOException {

    jgen.writeStartObject();
    jgen.writeObjectField("content", page.getContent());
    jgen.writeBooleanField("last", page.isLast());
    jgen.writeNumberField("totalElements", page.getTotalElements());
    jgen.writeNumberField("pageSize", page.getPageable().getPageSize());
    jgen.writeNumberField("pageNumber", page.getPageable().getPageNumber());
    jgen.writeEndObject();
  }
}
