# clickhouse-chproxy
This is a Docker images of a [chproxy](https://github.com/Vertamedia/chproxy).
Help document, please refer to:[readme](https://github.com/Vertamedia/chproxy)

# Supported tags and respective `Dockerfile` links
* `1.0.0` [(1.0.0/Dockerfile)](https://github.com/tacyuuhon/clickhouse-chproxy/blob/v1.0.0/Dockerfile)

# Run
```
docker run -it -v {config_path}/config.yml:/opt/config.yml tacyuuhon/clickhouse-chproxy
```

# Build
If you want to rebuild images.
You can be like this:
```
# v1.0.0 
git clone git@github.com:tacyuuhon/clickhouse-chproxy.git
cd clickhouse-chproxy
git checkout v1.0.0
docker build --no-cache -t {namespace}/{repository_name} . 

```

# Reload config.yml
If you modify `config.yml` you don't need to restart the chproxy.
You can use docker to send SIGHUP to reload the `config.yml`
```
docker kill --signal="SIGHUP" {CONTAINER_ID|CONTAINER_NAME}
```


