FROM golang:1.17 as builder

WORKDIR /go/src/app
COPY . .

RUN go build -ldflags "-s -w" main.go

FROM alpine:3.5

WORKDIR /go/bin/app
COPY --from=builder ["/go/src/app/main", "/go/src/app/entrypoint.sh", "./"]

ENTRYPOINT [ "./entrypoint.sh" ]