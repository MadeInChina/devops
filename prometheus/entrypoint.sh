#!/bin/sh
echo "update prometheus.yml...from system environments"
envsubst < /etc/prometheus/prometheus.template.yml > /etc/prometheus/prometheus.yml && \
cat /etc/prometheus/prometheus.yml && \

exec /bin/prometheus "$@"
