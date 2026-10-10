FROM golang:1.27-alpine AS builder
RUN apk add --no-cache git ca-certificates
WORKDIR /src
RUN git clone --depth 1 --branch v5.36.0 https://github.com/TwiN/gatus.git .
RUN go get golang.org/x/image@v0.45.0 golang.org/x/net@v0.60.0 google.golang.org/grpc@v1.83.2 \
    && go mod tidy
RUN CGO_ENABLED=0 GOOS=linux go build -o gatus .

FROM scratch
COPY --from=builder /src/gatus /gatus
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY app/config.yaml /config/config.yaml
ENV GATUS_CONFIG_PATH=""
ENV GATUS_LOG_LEVEL="INFO"
ENV PORT=8080
EXPOSE 8080
ENTRYPOINT ["/gatus"]