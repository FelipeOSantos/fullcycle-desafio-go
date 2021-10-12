FROM golang:1.17 as builder

WORKDIR /go/src/app
COPY . .

RUN go build -ldflags "-s -w" main.go

FROM scratch

WORKDIR /go/bin/app
COPY --from=builder go/src/app/main .

ENTRYPOINT [ "./main" ]

