FROM nimlang/nim:alpine as build
RUN apk add gcc libc-dev
RUN mkdir /app
COPY wc.nim /app
WORKDIR /app
RUN nim --gcc.exe:gcc --gcc.linkerexe:gcc --passL:-static -d:release c wc.nim

FROM scratch
COPY --from=build /app/wc /wc
ENTRYPOINT ["/wc"]