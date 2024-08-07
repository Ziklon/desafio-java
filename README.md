# Desafio Java 

## Configurando el entorno 


### Elementos necesarios

- Verificar que tienes configurado Java 21, para verificar puedes validar ejecutando el comando `java -version`
- Contar con docker y docker-compose instalados.
- Instalar Insomnia desde https://insomnia.rest/

### Instalar los servicios necesarios.

```bash
docker-compose up
```
El comando va instalar los siguientes servicios.

  - Postgres 16
    - Es usado para guardar los registros de productos y categorias.
  - Zookeeper
    - Apache ZooKeeper es un servicio de coordinación centralizado para sistemas distribuidos. En este proyecto es usado por Kafka.
  - Debezium
    - Debezium es una plataforma de código abierto para la captura de datos de cambios (CDC, por sus siglas en inglés). Permite a las aplicaciones monitorear y capturar cambios en una base de datos y propagar esos cambios a otros sistemas en tiempo real
  - Kafka
    - Se utiliza en Debezium principalmente como el mecanismo de transporte para los eventos de cambio capturados de las bases de datos.
  - Redis
    - Usado para registrar los contadores de metricas como numero de INSERTs agrupados por category_id.

### Configurar Debezium Connect

Ejecutar el siguiente commando

```bash
curl -X POST -H "Content-Type: application/json" --data @connector.json http://localhost:8083/connectors | jq
```
El comando anterior va configurar Postgres con Kafka capturando los eventos y publicandose los mensajes al topico `desafio.public.product`


### Importar los ejemplos de Request
Importar `Insomnia-request.json` dentro de Insomnia para poder consumir los servicios REST.

### Hacer build del proyecto.

Ejecutar el siguiente comando
```bash
./gradlew clean build
```

### Ejecutar los servicios `product` y `event-listener`

1. Iniciar product service en el puerto 8080
```bash
./gradlew product:bootRun
```

2. Iniciar event-listener service en el puerto 8081
```bash
./gradlew event-listener:bootRun
```


