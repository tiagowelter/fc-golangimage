FROM golang:alpine AS builder

WORKDIR /app

COPY . .

RUN go build -ldflags="-s -w" -o app .

FROM scratch

COPY --from=builder /app/app /app

ENTRYPOINT ["/app"]
