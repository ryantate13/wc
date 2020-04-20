FROM nimlang/nim:alpine as build
RUN mkdir /app
COPY stats.nim /app
WORKDIR /app
RUN nim --passL:-static -d:release c stats.nim

FROM docker
COPY --from=build /app/stats /usr/local/bin/stats
ENTRYPOINT ["stats"]