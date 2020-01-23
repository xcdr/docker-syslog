FROM alpine:3.8

LABEL maintainer="Adam Kubica <xcdr@kaizen-step.com>"

ENV TZ=Europe/Warsaw
ENV SYSLOG_PORT=514

RUN apk --no-cache add syslog-ng bzip2

RUN mkdir -p /opt/etc
RUN mkdir -p /opt/bin

ADD syslog-ng /opt/etc/syslog-ng
ADD bin /opt/bin/

RUN chmod 700 /opt/bin/compress_logs.sh

EXPOSE ${SYSLOG_PORT}/tcp ${SYSLOG_PORT}/udp

VOLUME /opt/etc/syslog-ng
VOLUME /app_data

CMD ["/usr/sbin/syslog-ng", "-F" ,"-f", "/opt/etc/syslog-ng/syslog-ng.conf", "--no-caps"]

