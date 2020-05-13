# Builder image
FROM golang:1.13-alpine as builder

RUN apk add --no-cache \
    wget \
    make \
    git \

RUN mkdir /hw_docker

WORKDIR /hw_docker

COPY * .

RUN go mod download

RUN go build -o ./hw_exe .


FROM alpine:3.9

RUN apk add ca-certificates

COPY --from=builder /hw_docker/hw_exe /hw_exe

EXPOSE 8080

CMD ["/hw_exe"]