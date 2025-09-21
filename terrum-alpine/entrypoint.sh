#!/bin/bash

# Start Loki in the background.
echo "Starting Loki..."
/usr/local/bin/loki -config.file=/etc/loki/loki-config.yaml > /dev/null 2>&1 &

# Start the random log generator in the background.
echo "Starting log generator..."
/usr/local/bin/random_log_generator.sh > /dev/null 2>&1 &

# Start Prometheus in the foreground.
# Keep the container running.
echo "Starting Prometheus..."
/usr/local/bin/prometheus --config.file=/etc/prometheus/prometheus.yml --storage.tsdb.path=/prometheus
