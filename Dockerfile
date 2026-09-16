# syntax=docker/dockerfile:1
# SwampUp 2026 ZTR demo: the jar is built by the GitHub Actions workflow via
# `jf mvn`, resolving dependencies through solenglatest's ZTR-enabled
# maven-selfheal-virtual repo, so Artifactory (not this Dockerfile) is what
# determines which log4j-core build ends up in target/*.jar.
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
