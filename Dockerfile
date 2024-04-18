ARG OS="windows"
ARG ARCH="amd64"

FROM quay.io/projectquay/golang:1.20 as builder
WORKDIR /src
COPY src .

RUN GO_ENABLED=0 GOOS=$OS GOARCH=$ARCH go build -o app

FROM scratch
ADD ./html /html
COPY --from=builder /src/app .
ENTRYPOINT ["/app"]
EXPOSE 8765
