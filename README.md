# Docker image for syslog-ng (Alpine)

## Create container
```shell
docker create --net=host --env SYSLOG_PORT=1514 \
    --volume /mnt/logarch/data:/app_data \
    --name logarch xdr/syslog
```

When You create container with custom config:

```
docker run --volume /mnt/logarch/conf:/mnt/tmp \
    xcdr/syslog cp /opt/etc/syslog-ng/syslog-ng.conf /mnt/tmp/

docker create --net=host --env SYSLOG_PORT=1514 \
    --volume /mnt/logarch/conf:/opt/etc/syslog-ng \
    --volume /mnt/logarch/data:/app_data \
    --name logarch xcdr/syslog
```

## Start container
```shell
docker start logarch
```

## Archive old logs
```shell
docker exec logarch /opt/bin/compress_logs.sh
```

## Test container
```shell
logger -n 127.0.0.1 -P 1514 --udp --rfc3164 "Test logarch"
```

## License

MIT
