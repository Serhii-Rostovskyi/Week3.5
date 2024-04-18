ARG OS="windows"
ARG ARCH="amd64"

FROM quay.io/projectquay/golang:1.20 as builder
WORKDIR /src
COPY src .
COPY ./html /html

RUN GO_ENABLED=0 GOOS=$OS GOARCH=$ARCH go build -o site 


ENTRYPOINT ["./site"]
EXPOSE 8080
