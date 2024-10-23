# Usa una imagen oficial de Maven 3.6.2 con OpenJDK 19
FROM maven:3.6.2-openjdk-19 as build

# Establece el directorio de trabajo
WORKDIR /app

# Copia todo el contenido del proyecto al contenedor
COPY . .

# Ejecuta el empaquetado del proyecto usando Maven
RUN mvn clean package -DskipTests

# Usa una imagen ligera de OpenJDK para ejecutar el JAR
FROM openjdk:19-jdk-slim

# Establece el directorio de trabajo en la nueva imagen
WORKDIR /app

# Copia el JAR generado desde la imagen anterior
COPY --from=build /app/target/cursoSpringBoot.jar app.jar

# Expone el puerto en el que corre tu aplicación
EXPOSE 9000

# Comando para iniciar la aplicación
CMD ["java", "-jar", "app.jar"]
