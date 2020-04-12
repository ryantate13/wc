FROM alpine:3.11 as build
RUN apk add gcc libc-dev
COPY wc.c /tmp
WORKDIR /tmp
RUN gcc -O3 -o wc wc.c -static

FROM scratch
COPY --from=build /tmp/wc /wc
ENTRYPOINT ["/wc"]
