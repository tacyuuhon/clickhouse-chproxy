# clickhouse-chproxy
This is a Docker images of a [chproxy](https://github.com/Vertamedia/chproxy).
Help document, please refer to:[readme](https://github.com/Vertamedia/chproxy)

# Supported tags and respective `Dockerfile` links

* `1.6.0 ~ 1.10.1`,`latest` [(1.10.1/Dockerfile)](https://github.com/tacyuuhon/clickhouse-chproxy/blob/master/Dockerfile)
* `1.5.0` [(1.5.0/Dockerfile)](https://github.com/tacyuuhon/clickhouse-chproxy/blob/v1.5.0/Dockerfile)
* `1.4.0` [(1.4.0/Dockerfile)](https://github.com/tacyuuhon/clickhouse-chproxy/blob/v1.4.0/Dockerfile)
* `1.3.0` [(1.3.0/Dockerfile)](https://github.com/tacyuuhon/clickhouse-chproxy/blob/v1.3.0/Dockerfile)
* `1.2.0` [(1.2.0/Dockerfile)](https://github.com/tacyuuhon/clickhouse-chproxy/blob/v1.2.0/Dockerfile)
* `1.1.0` [(1.1.0/Dockerfile)](https://github.com/tacyuuhon/clickhouse-chproxy/blob/v1.1.0/Dockerfile)
* `1.0.1` [(1.0.1/Dockerfile)](https://github.com/tacyuuhon/clickhouse-chproxy/blob/v1.0.1/Dockerfile)
* `1.0.0` [(1.0.0/Dockerfile)](https://github.com/tacyuuhon/clickhouse-chproxy/blob/v1.0.0/Dockerfile)

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

# v1.6.0 ~ v1.10.1
git clone git@github.com:tacyuuhon/clickhouse-chproxy.git
cd clickhouse-chproxy
git checkout master
# version=1.6.0 ~ 1.10.1
docker build --build-arg CHPROXY_VERSION={version} --no-cache -t {namespace}/{repository_name} . 
```


