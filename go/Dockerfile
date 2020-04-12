FROM golang:alpine as build
RUN apk add libc-dev
COPY wc.go /go/wc.go
WORKDIR /go
RUN go build -ldflags '-extldflags "-static"' -o wc wc.go

FROM scratch
COPY --from=build /go/wc /wc
ENTRYPOINT ["/wc"]