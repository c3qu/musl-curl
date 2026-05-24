# curl-musl

A minimal curl Docker image built on [stunnel/static-curl](https://github.com/stunnel/static-curl).

- **Base image**: `scratch` (empty image, no system files)
- **Size**: ~4MB (with CA certificates, UPX compressed)
- **Architecture**: `amd64` / `arm64`
- **Auto-update**: GitHub Actions checks for new static-curl versions daily and builds/pushes automatically

## Usage

```bash
docker run --rm tanxme/musl-curl curl https://httpbin.org/ip
```


## License

MIT
