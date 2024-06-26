# speedtest-exporter

Exports [Speedtest CLI](https://www.speedtest.net/apps/cli) metrics in the prometheus format, caching the results. This code is a fork of the original code from [Carlos Becker](https://github.com/caarlos0/speedtest-exporter). It has been modified to meet some specific needs, specifically around being more container friendly. A list of changes are [below](#changes).

<img width="2218" alt="image" src="https://user-images.githubusercontent.com/245435/113709484-e8deda80-96b8-11eb-846f-478b27395ec5.png">

## Changes

The following changes have been made to the original code.

1. Modified the Dockerfile to compile the latest Go code onto an Alpine linux image with the latest version of the [Ookla Speedtest CLI](https://www.speedtest.net/apps/cli).

## Compile Docker Image

Compiling the docker image locally is straight forward once the [Docker Engine](https://docs.docker.com/engine/install/) is installed. This will compile the application and copy it to another container as part of a multi-stage container build.

```console
docker buildx build -t <image>:<tag> .
```

## Links

- [Grafana Dashboard](https://grafana.com/grafana/dashboards/14187)
- [Installing speedtest CLI](https://www.speedtest.net/apps/cli)


## Install

**homebrew**:

```sh
brew install caarlos0/tap/speedtest-exporter
```

**docker**:

```sh
docker run --rm -p 9876:9876 caarlos0/speedtest-exporter
```

**apt**:

```sh
echo 'deb [trusted=yes] https://repo.caarlos0.dev/apt/ /' | sudo tee /etc/apt/sources.list.d/caarlos0.list
sudo apt update
sudo apt install speedtest-exporter
```

**yum**:

```sh
echo '[caarlos0]
name=caarlos0
baseurl=https://repo.caarlos0.dev/yum/
enabled=1
gpgcheck=0' | sudo tee /etc/yum.repos.d/caarlos0.repo
sudo yum install speedtest-exporter
```

**deb/rpm/apk**:

Download the `.apk`, `.deb` or `.rpm` from the [releases page][releases] and install with the appropriate commands.

**manually**:

Download the pre-compiled binaries from the [releases page][releases] or clone the repo build from source.

[releases]: https://github.com/caarlos0/speedtest-exporter/releases

## Stargazers over time

[![Stargazers over time](https://starchart.cc/caarlos0/speedtest-exporter.svg)](https://starchart.cc/caarlos0/speedtest-exporter)
