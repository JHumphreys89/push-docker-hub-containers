![License](https://img.shields.io/github/license/JHumphreys89/push-docker-hub-containers)
![Issues](https://img.shields.io/github/issues/JHumphreys89/push-docker-hub-containers)
![PRs](https://img.shields.io/github/issues-pr/JHumphreys89/push-docker-hub-containers)
![Dependabot](https://img.shields.io/badge/dependabot-active-brightgreen?logo=dependabot)
[![Build and Publish Image to Docker](https://github.com/JHumphreys89/push-docker-hub-containers/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/JHumphreys89/push-docker-hub-containers/actions/workflows/docker-publish.yml)

# push-infra-containers

Repository for building container images that are hosted on [Docker Hub](https://hub.docker.com/).

## Overview

This repository contains Dockerfiles and supporting scripts for building and maintaining infrastructure-related container images. These images are published to Docker Hub for use in the `terrum` test environment.

## Directory Structure

- `terrum/`
	- `Dockerfile`: Dockerfile for the base `terrum` image.
- `terrum-alpine/`
	- `Dockerfile`: Dockerfile for the Alpine-based `terrum` image.
	- `entrypoint.sh`: Entrypoint script for the container.
	- `loki-config.yaml`: Loki configuration file.
	- `prometheus.yml`: Prometheus configuration file.
	- `random_log_generator.sh`: Script to generate random logs for testing.

## Usage

To pull the Docker images from Docker Hub, use the following commands:

```sh
docker pull JHumphreys89/terrum:latest
docker pull JHumphreys89/terrum-alpine:latest
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## Security

See [SECURITY.md](SECURITY.md) for security policies.

## License

This project is licensed under the terms of the [LICENSE](LICENSE).
