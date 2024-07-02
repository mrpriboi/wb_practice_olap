1. Поднять кликхаус в докере
```
docker run -d -p 8123:8123 --name my_click_server --ulimit nofile=262144:262144 clickhouse/clickhouse-server
```
