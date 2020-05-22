#!/bin/sh

envsubst < /etc/prometheus/prometheus.template.yml > /etc/prometheus/prometheus.yml && \
/bin/prometheus
