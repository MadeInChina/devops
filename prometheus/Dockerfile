FROM golang:alpine
RUN apk add --update git 
RUN go get -u -v github.com/a8m/envsubst/cmd/envsubst

FROM prom/prometheus:v2.18.1

COPY --from=0 /go/bin/envsubst /usr/bin/envsubst

ADD prometheus.template.yml /etc/prometheus/prometheus.template.yml

ADD entrypoint.sh /etc/prometheus/entrypoint.sh

USER root

RUN chmod +x /etc/prometheus/entrypoint.sh

USER nobody

EXPOSE 9090

VOLUME [ "/prometheus" ]

WORKDIR /prometheus

ENTRYPOINT ["/etc/prometheus/entrypoint.sh"]

CMD        [ "--config.file=/etc/prometheus/prometheus.yml", \
             "--storage.tsdb.path=/prometheus", \
             "--web.console.libraries=/usr/share/prometheus/console_libraries", \
             "--web.console.templates=/usr/share/prometheus/consoles" ]
