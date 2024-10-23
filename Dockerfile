# Usa una imagen base de Java
FROM openjdk:11-jre-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia el archivo JAR del microservicio a la imagen Docker
COPY target/cursoSpringBoot.jar app.jar

# Expone el puerto en el que corre tu aplicación
EXPOSE 9000

# Comando para iniciar la aplicación
CMD ["java", "-jar", "app.jar"]
