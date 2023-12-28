FROM golang:1.21 AS builder

WORKDIR /app

COPY *.go ./
RUN go build -o woof *.go

###

FROM ubuntu:latest

RUN apt-get update
RUN apt-get install --no-install-recommends -y curl ca-certificates

WORKDIR /app
COPY --from=builder /app/woof /app/woof

# Copy default config
COPY config.json .

# Default port used by woof
EXPOSE 8000

# Run
ENTRYPOINT ["./woof"]