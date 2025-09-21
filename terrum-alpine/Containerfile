# Use latest official version of Alpine Linux as base image
FROM ${{ vars.ALPINE_BASE_IMAGE }}

# Set up environment vars for Prometheus and Loki versions
ENV PROM_VERSION=${{ vars.PROM_VERSION }} \
    LOKI_VERSION=${{ vars.LOKI_VERSION }}

# Install necessary packages and download Prometheus and Loki binaries
run apk update && \
    apk add --no-cache curl bash procps

# Create a non-root user and group
RUN addgroup -S prom && \
    adduser -S -G prom prom && \
    addgroup -S loki && \
    adduser -S -G loki loki

# Create directories for Prometheus and Loki config and data
RUN mkdir -p /etc/prometheus /prometheus && \
    mkdir -p /etc/loki /loki

# Download, extract, and clean up Prometheus binary
WORKDIR /tmp
RUN curl -L "https://github.com/prometheus/prometheus/releases/download/v${PROM_VERSION}/prometheus-${PROM_VERSION}.linux-amd64.tar.gz" -o prometheus.tar.gz && \
    tar xvf prometheus.tar.gz && \
    mv prometheus-${PROM_VERSION}.linux-amd64/prometheus /usr/local/bin/ && \
    mv prometheus-${PROM_VERSION}.linux-amd64/promtool /usr/local/bin/ && \
    mv prometheus-${PROM_VERSION}.linux-amd64/consoles /etc/prometheus/ && \
    mv prometheus-${PROM_VERSION}.linux-amd64/console_libraries /etc/prometheus/ && \
    rm -rf prometheus.tar.gz prometheus-${PROM_VERSION}.linux-amd64

# Download, extract, and clean up Loki binary
RUN curl -L "https://github.com/grafana/loki/releases/download/v${LOKI_VERSION}/loki-linux-amd64.zip" -o loki.zip && \
    unzip loki.zip -d /usr/local/bin/ && \
    rm loki.zip

# Set perms and ownership
RUN chown -R prom:prom /etc/prometheus /prometheus && \
    chown -R loki:loki /etc/loki /loki && \
    chmod +x /usr/local/bin/prometheus /usr/local/bin/promtool /usr/local/bin/loki

# Copy config files and entrypoint script into the image
COPY prometheus.yml /etc/prometheus/prometheus.yml
COPY loki-config.yaml /etc/loki/loki-config.yaml
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
COPY random_log_generator.sh /usr/local/bin/random_log_generator.sh

# Give entrypoint script execute permissions
RUN chmod +x /usr/local/bin/entrypoint.sh /usr/local/bin/random_log_generator.sh

# Expose ports for Prometheus and Loki
EXPOSE 9090 3100

# Set the entrypoint to our script that starts all services
CMD ["/usr/local/bin/entrypoint.sh"]
