# Usa una imagen oficial de OpenJDK 19
FROM openjdk:19-jdk-slim

# Establece el directorio de trabajo
WORKDIR /app

# Instala Maven
RUN apt-get update && \
    apt-get install -y maven && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copia todo el contenido del proyecto al contenedor
COPY . .

# Ejecuta el empaquetado del proyecto usando Maven
RUN mvn clean package -DskipTests

# Expone el puerto en el que corre tu aplicación
EXPOSE 9000

# Comando para iniciar la aplicación
CMD ["java", "-jar", "target/cursoSpringBoot.jar"]
