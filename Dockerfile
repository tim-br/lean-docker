FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    git \
    && rm -rf /var/lib/apt/lists/*

ENV ELAN_HOME=/usr/local/elan
ENV PATH="${ELAN_HOME}/bin:${PATH}"

RUN curl -sSf https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh | sh -s -- -y --no-modify-path --default-toolchain leanprover/lean4:stable \
    && elan default stable

WORKDIR /opt/test-runner
