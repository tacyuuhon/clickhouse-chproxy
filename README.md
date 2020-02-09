# clickhouse-chproxy
This is a Docker images of a [chproxy](https://github.com/Vertamedia/chproxy).
Help document, please refer to:[README](https://github.com/Vertamedia/chproxy)

# Supported tags and respective `Dockerfile` links

* `1.13.2-1`, `1.14.0-curl` [(1.14.0-curl/Dockerfile)](https://github.com/tacyuuhon/clickhouse-chproxy/blob/curl/Dockerfile)
* `1.6.0 ~ 1.14.0`, `latest` [(1.14.0/Dockerfile)](https://github.com/tacyuuhon/clickhouse-chproxy/blob/master/Dockerfile)
* `1.5.0` [(1.5.0/Dockerfile)](https://github.com/tacyuuhon/clickhouse-chproxy/blob/v1.5.0/Dockerfile)
* `1.4.0` [(1.4.0/Dockerfile)](https://github.com/tacyuuhon/clickhouse-chproxy/blob/v1.4.0/Dockerfile)
* `1.3.0` [(1.3.0/Dockerfile)](https://github.com/tacyuuhon/clickhouse-chproxy/blob/v1.3.0/Dockerfile)
* `1.2.0` [(1.2.0/Dockerfile)](https://github.com/tacyuuhon/clickhouse-chproxy/blob/v1.2.0/Dockerfile)
* `1.1.0` [(1.1.0/Dockerfile)](https://github.com/tacyuuhon/clickhouse-chproxy/blob/v1.1.0/Dockerfile)
* `1.0.1` [(1.0.1/Dockerfile)](https://github.com/tacyuuhon/clickhouse-chproxy/blob/v1.0.1/Dockerfile)
* `1.0.0` [(1.0.0/Dockerfile)](https://github.com/tacyuuhon/clickhouse-chproxy/blob/v1.0.0/Dockerfile)

Link on docker hub: [tacyuuhon/clickhouse-chproxy](https://hub.docker.com/r/tacyuuhon/clickhouse-chproxy/)

> Tip:
>
> `1.13.2-1` is a special version. 
> Just added a `curl` to the container.
> You can use it for [healthcheck](https://docs.docker.com/compose/compose-file/#healthcheck)  
> Thank you for @[**yohannj**](https://github.com/yohannj) commit the [PR](https://github.com/tacyuuhon/clickhouse-chproxy/pull/24)
> 
> `1.14.0-curl` tag include curl command  
> `1.14.0` tag not include curl command






# Run
```
docker run -it -v {config_path}/config.yml:/opt/config.yml tacyuuhon/clickhouse-chproxy
```

# Build
If you want to rebuild images.
You can be like this:
```
# v1.0.0 ~ v1.5.0
git clone git@github.com:tacyuuhon/clickhouse-chproxy.git
cd clickhouse-chproxy
# branch=v1.0.0 ~ v1.5.0
git checkout {branch} 
docker build --no-cache -t {namespace}/{repository_name} . 

# v1.6.0 ~ v1.14.0
git clone git@github.com:tacyuuhon/clickhouse-chproxy.git
cd clickhouse-chproxy
git checkout master
# version=1.6.0 ~ 1.14.0
docker build --build-arg CHPROXY_VERSION={version} --no-cache -t {namespace}/{repository_name} . 
```

# Reload config.yml
If you modify `config.yml` you don't need to restart the chproxy.
You can use docker to send SIGHUP to reload the `config.yml`
```
docker kill --signal="SIGHUP" {CONTAINER_ID|CONTAINER_NAME}
```

