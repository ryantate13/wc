FROM nimlang/nim:alpine as build
RUN mkdir /app
COPY wc.nim /app
WORKDIR /app
RUN nim --passL:-static -d:release c wc.nim

FROM scratch
COPY --from=build /app/wc /wc
ENTRYPOINT ["/wc"]