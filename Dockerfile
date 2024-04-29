FROM golang:1.21-bookworm AS debug

WORKDIR /app

COPY ./go.* /app/
RUN go mod download

COPY . /app

CMD ["tail", "-f", "/dev/null"]

# build continer
FROM golang:1.21-bookworm AS builder

WORKDIR /tmp/app

COPY go.* ./
RUN go mod download

COPY . ./
RUN go build -o "go-orm-test" -ldflags="-w -s"


# runtime continer
FROM gcr.io/distroless/base-debian12

COPY --from=builder /tmp/app/go-orm-test /root/go-orm-test

CMD ["/root/go-orm-test"]
