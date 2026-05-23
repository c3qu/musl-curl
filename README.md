# curl-musl

基于 [stunnel/static-curl](https://github.com/stunnel/static-curl) 构建的 minimal curl Docker 镜像。

- **基础镜像**: `scratch`（空镜像，无任何系统文件）
- **大小**: ~4MB（含 CA 证书，UPX 压缩后）
- **架构**: `amd64` / `arm64`
- **自动更新**: GitHub Actions 每日检测 static-curl 新版本并自动构建推送

## 使用

```bash
docker run --rm <user>/musl-curl curl https://httpbin.org/ip
```

或在 Dockerfile 中：

```dockerfile
COPY --from=<user>/musl-curl /bin/curl /bin/curl
COPY --from=<user>/musl-curl /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
```

## 手动构建

```bash
docker build --build-arg CURL_VERSION=8.20.0 -t curl-musl .
```

## 许可证

MIT
