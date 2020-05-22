FROM debian:stretch

RUN apt-get update && apt-get install -y --no-install-recommends \
    gettext \
    && rm -rf /var/lib/apt/lists/*

FROM prom/prometheus:v2.18.1

COPY --from=0 /usr/bin/envsubst /usr/bin/envsubst

RUN ls -al /usr/bin/envsubst

ADD prometheus.template.yml /etc/prometheus/prometheus.template.yml

ADD entrypoint.sh /etc/prometheus/entrypoint.sh

RUN  /etc/prometheus/entrypoint.sh

RUN chmod -R a+x /etc/prometheus/entrypoint.sh

VOLUME [ "/prometheus" ]

WORKDIR /prometheus

ENTRYPOINT ["/etc/prometheus/entrypoint.sh"]

CMD        [ "-config.file=/etc/prometheus/prometheus.yml", \
             "-storage.local.path=/prometheus", \
             "-web.console.libraries=/etc/prometheus/console_libraries", \
             "-web.console.templates=/etc/prometheus/consoles" ]
