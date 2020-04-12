FROM rust:1.42 as build
RUN rustup target add x86_64-unknown-linux-musl
RUN mkdir /app
WORKDIR /app
COPY wc.rs /app/wc.rs
RUN rustc --target x86_64-unknown-linux-musl -C opt-level=3 wc.rs

FROM scratch
COPY --from=build /app/wc /wc
ENTRYPOINT ["/wc"]