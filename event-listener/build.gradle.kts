plugins {
    id("java")
    id("org.springframework.boot") version "3.3.2"
    id("io.spring.dependency-management") version "1.1.6"
}

group = "org.darkbit"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

dependencies {

    compileOnly("org.projectlombok:lombok:1.18.34")
    annotationProcessor("org.projectlombok:lombok:1.18.34")
    testCompileOnly("org.projectlombok:lombok:1.18.34")
    testAnnotationProcessor ("org.projectlombok:lombok:1.18.34")

    implementation("commons-collections:commons-collections:3.2.2")
    implementation("org.springframework.boot:spring-boot-starter-web")
    implementation("org.apache.commons:commons-collections4:4.4")
    implementation("org.modelmapper:modelmapper:3.2.0")
    implementation("org.modelmapper:modelmapper-module-record:1.0.0")
    testImplementation("org.springframework.boot:spring-boot-starter-test")
    testRuntimeOnly("org.junit.platform:junit-platform-launcher")

    testImplementation(platform("org.junit:junit-bom:5.10.0"))
    testImplementation("org.junit.jupiter:junit-jupiter")

    implementation("org.springframework.kafka:spring-kafka")
    implementation("org.springframework.data:spring-data-redis:3.3.2")

    implementation("redis.clients:jedis:5.0.2")
}

tasks.test {
    useJUnitPlatform()
}