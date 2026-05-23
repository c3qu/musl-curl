# curl-musl

基于 [stunnel/static-curl](https://github.com/stunnel/static-curl) 构建的 minimal curl Docker 镜像。

- **基础镜像**: `scratch`（空镜像，无任何系统文件）
- **大小**: ~4MB（含 CA 证书，UPX 压缩后）
- **架构**: `amd64` / `arm64`
- **自动更新**: GitHub Actions 每日检测 static-curl 新版本并自动构建推送

## 使用

```bash
docker run --rm tanxme/musl-curl curl https://httpbin.org/ip
```


## 许可证

MIT
