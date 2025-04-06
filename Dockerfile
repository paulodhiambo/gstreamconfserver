# -------- Stage 1: Build --------
FROM eclipse-temurin:21 as builder

WORKDIR /app
COPY . .
RUN ./gradlew clean build

# -------- Stage 2: Run --------
FROM eclipse-temurin:21

WORKDIR /app
COPY --from=builder /app/build/libs/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
