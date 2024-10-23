# Usa una imagen oficial de Maven con OpenJDK 11
FROM maven:3.6.2-openjdk-11

# Establece el directorio de trabajo
WORKDIR /app

# Copia todo el contenido del proyecto al contenedor
COPY . .

# Ejecuta el empaquetado del proyecto usando Maven
RUN mvn clean package

# Usa una imagen ligera de OpenJDK para ejecutar el JAR
FROM openjdk:11-jre-slim

# Establece el directorio de trabajo en la nueva imagen
WORKDIR /app

# Copia el JAR generado desde la imagen anterior
COPY --from=0 /app/target/cursoSpringBoot.jar app.jar

# Expone el puerto en el que corre tu aplicación
EXPOSE 9000

# Comando para iniciar la aplicación
CMD ["java", "-jar", "app.jar"]
