package org.darkbit.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import lombok.Data;
import lombok.Getter;
import org.darkbit.serde.MillisToLocalDateTimeDeserializer;
import org.darkbit.serde.OperationTypeDeserializer;

import java.time.LocalDateTime;
import java.util.Map;

@Data
public class DebeziumEventDto {
  private Payload payload;

  @Data
  public static class Payload {
    private Source source;
    private Map<String, Object> before;
    private Map<String, Object> after;

    @JsonProperty("op")
    @JsonDeserialize(using = OperationTypeDeserializer.class)
    @JsonFormat
    private OperationType operationType;

    @Data
    public static class Source {
      @JsonProperty("ts_ms")
      @JsonDeserialize(using = MillisToLocalDateTimeDeserializer.class)
      private LocalDateTime transactionTime;

      private String db;
      private String schema;
      private String table;

      @JsonProperty("txId")
      private long transactionId;
    }
  }

  @Getter
  public enum OperationType {
    CREATE("c"),
    UPDATE("u"),
    DELETE("d"),
    READ("r");

    private final String code;

    OperationType(String code) {
      this.code = code;
    }

    public static OperationType fromCode(String code) {
      for (OperationType type : OperationType.values()) {
        if (type.getCode().equals(code)) {
          return type;
        }
      }
      throw new IllegalArgumentException("Unknown operation type code: " + code);
    }
  }
}
