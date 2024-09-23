ARG GOLANG_VERSION=1.23.1
ARG DISTRO_VERSION=bookworm
ARG UPSTREAM_RELEASE_TAG=v1.8.4

FROM golang:${GOLANG_VERSION}-${DISTRO_VERSION} as gobuild
ARG GOLANG_VERSION
ARG DISTRO_VERSION
ARG UPSTREAM_RELEASE_TAG

WORKDIR /tmp

RUN mkdir release && \
    curl -L "https://github.com/hashicorp/nomad/archive/refs/tags/${UPSTREAM_RELEASE_TAG}.tar.gz" | tar xvz --strip 1 -C ./release

WORKDIR /tmp/release/

RUN go build -ldflags="-X 'main.Version=$UPSTREAM_RELEASE_TAG' -X 'main.BuildTime=$(date +%B\ %Y)'" -o /usr/local/bin/nomad

