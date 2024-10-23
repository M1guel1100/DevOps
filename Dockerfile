# Usa una imagen oficial de Maven 3.6.3 con OpenJDK 11
FROM maven:3.6.3-openjdk-11 as build

# Establece el directorio de trabajo
WORKDIR /app

# Copia todo el contenido del proyecto al contenedor
COPY . .

# Instalación específica de Maven 3.6.2
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://archive.apache.org/dist/maven/maven-3/3.6.2/binaries/apache-maven-3.6.2-bin.tar.gz && \
    tar -zxvf apache-maven-3.6.2-bin.tar.gz && \
    mv apache-maven-3.6.2 /usr/share/maven && \
    rm apache-maven-3.6.2-bin.tar.gz && \
    rm -f /usr/bin/mvn && \
    ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

# Ejecuta el empaquetado del proyecto usando Maven 3.6.2
RUN mvn clean package

# Usa una imagen ligera de OpenJDK para ejecutar el JAR
FROM openjdk:11-jre-slim

# Establece el directorio de trabajo en la nueva imagen
WORKDIR /app

# Copia el JAR generado desde la imagen anterior
COPY --from=build /app/target/cursoSpringBoot.jar app.jar

# Expone el puerto en el que corre tu aplicación
EXPOSE 9000

# Comando para iniciar la aplicación
CMD ["java", "-jar", "app.jar"]
