FROM ekidd/rust-musl-builder AS build
WORKDIR /home/rust/src
COPY Cargo.toml Cargo.lock ./
COPY src ./src
RUN cargo build --release

FROM scratch
COPY --from=build /home/rust/src/target/x86_64-unknown-linux-musl/release/rust-hello /
CMD ["/rust-hello"]
