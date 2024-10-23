 #Etapa 1: Construir el proyecto
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
# Copiar el archivo pom.xml y resolver las dependencias
COPY pom.xml .
RUN mvn dependency:go-offline
# Copiar el resto del código fuente
COPY src ./src
# Construir la aplicación
RUN mvn clean package

# Etapa 2: Ejecutar la aplicación
FROM openjdk:17-jdk-slim
WORKDIR /app
# Copiar el JAR construido desde la etapa anterior
COPY --from=build /app/target/*.jar app.jar
# Ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar", "--server.port=9001"]