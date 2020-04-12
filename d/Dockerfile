FROM alpine:edge as build
RUN apk add ldc gcc libc-dev
RUN mkdir /app
COPY wc.d /app/wc.d
WORKDIR /app
RUN ldc2 -O --static wc.d

FROM scratch
COPY --from=build /app/wc /wc
ENTRYPOINT ["/wc"]