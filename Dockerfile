FROM alpine:latest AS tool-env

RUN apk add --no-cache ca-certificates xz wget upx

ARG TARGETARCH
ARG CURL_VERSION=8.20.0

RUN set -x && \
    CURL_ARCH="" && \
    if [ "$TARGETARCH" = "amd64" ]; then \
        CURL_ARCH="x86_64"; \
    elif [ "$TARGETARCH" = "arm64" ]; then \
        CURL_ARCH="aarch64"; \
    else \
        echo "Unsupported architecture: $TARGETARCH" && exit 1; \
    fi && \
    \
    DOWNLOAD_URL="https://github.com/stunnel/static-curl/releases/download/${CURL_VERSION}/curl-linux-${CURL_ARCH}-musl-${CURL_VERSION}.tar.xz" && \
    echo "Downloading: ${DOWNLOAD_URL}" && \
    \
    wget -qO- "${DOWNLOAD_URL}" | tar -xJ -C /bin/ curl && \
    \
    chmod +x /bin/curl && upx --best /bin/curl

FROM scratch

COPY --from=tool-env /bin/curl /bin/curl
COPY --from=tool-env /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

ENTRYPOINT ["/bin/curl"]
