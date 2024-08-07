plugins {
    `kotlin-dsl`
}

repositories {
    mavenCentral()
    gradlePluginPortal()
}

dependencies {
    implementation("org.jetbrains.kotlin:kotlin-gradle-plugin:1.6.10")
    implementation("org.springframework.boot:spring-boot-gradle-plugin:3.3.2")
    implementation("io.spring.gradle:dependency-management-plugin:1.1.6")

}