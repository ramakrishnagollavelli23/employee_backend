FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

COPY . .

# 🔥 Fix permission issue
RUN chmod +x mvn

# Build jar
RUN ./mvn clean package -DskipTests

# Rename jar
RUN mv target/*.jar app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]