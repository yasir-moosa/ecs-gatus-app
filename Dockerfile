FROM ghcr.io/twin/gatus:stable
COPY /app/config.yaml /config/config.yaml
EXPOSE 8080