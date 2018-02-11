# clickhouse-chproxy
This is a Docker images of a [chproxy](https://github.com/Vertamedia/chproxy).
Help document, please refer to:[readme](https://github.com/Vertamedia/chproxy)

# Supported tags and respective `Dockerfile` links


# Run
```
docker run -it -v {config_path}/config.yml:/opt/config.yml tacyuuhon/clickhouse-chproxy
```

# Build
If you want to rebuild images.
You can be like this:
```


# Reload config.yml
If you modify `config.yml` you don't need to restart the chproxy.
You can use docker to send SIGHUP to reload the `config.yml`
```
docker kill --signal="SIGHUP" {CONTAINER_ID|CONTAINER_NAME}
```


