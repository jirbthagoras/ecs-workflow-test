FROM golang:1.22 AS builder

WORKDIR /app

COPY . .

RUN go mod download

RUN go build -o app

FROM debian:bullseye-slim

WORKDIR /root/

COPY --from=builder /app/app .

EXPOSE 8080

CMD ["./app"]