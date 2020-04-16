FROM oracle/graalvm-ce:20.0.0-java11 as build
RUN gu install native-image
RUN mkdir /app
COPY wc.java /app/wc.java
WORKDIR /app
RUN javac wc.java
RUN native-image --static -cp . wc -H:Name=wc

FROM scratch
COPY --from=build /app/wc /wc
ENTRYPOINT ["/wc"]