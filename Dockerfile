ARG GOLANG_VERSION=1.24.1
ARG ALPINE_VERSION=3.21
ARG UPSTREAM_RELEASE_TAG=v1.9.7

FROM golang:${GOLANG_VERSION}-alpine${ALPINE_VERSION} as gobuild
ARG GOLANG_VERSION
ARG ALPINE_VERSION
ARG UPSTREAM_RELEASE_TAG

WORKDIR /tmp

RUN apk add --no-cache gcc build-base linux-headers curl tar && \
    mkdir release && \
    curl -L "https://github.com/hashicorp/nomad/archive/refs/tags/${UPSTREAM_RELEASE_TAG}.tar.gz" | tar xvz --strip 1 -C ./release

WORKDIR /tmp/release/

RUN go build -ldflags="-X 'main.Version=$UPSTREAM_RELEASE_TAG' -X 'main.BuildTime=$(date +%B\ %Y)'" -o /usr/local/bin/nomad

FROM scratch
COPY --from=gobuild /usr/local/bin/nomad /usr/local/bin/nomad
ENTRYPOINT ["/usr/local/bin/nomad"]
