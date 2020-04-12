FROM alpine:3.11 as build
RUN apk add g++ libc-dev
COPY wc.cpp /tmp
WORKDIR /tmp
RUN g++ -O3 -o wc wc.cpp -static

FROM scratch
COPY --from=build /tmp/wc /wc
ENTRYPOINT ["/wc"]
