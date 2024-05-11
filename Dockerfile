FROM golang:1.22.3-alpine3.19 AS build
WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY *.go ./
COPY collector/*.go ./collector/

#RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-gs-ping

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -trimpath -ldflags="-s -w"

FROM alpine:3.19

# RUN apk add --no-cache ca-certificates

EXPOSE 9876
WORKDIR /

RUN wget -O /tmp/speedtest.tgz "https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-linux-$(apk info --print-arch).tgz" && \
 	tar xvfz /tmp/speedtest.tgz -C /usr/local/bin speedtest && \
 	rm -rf /tmp/speedtest.tgz
	
COPY --from=build /app/speedtest-exporter /usr/local/bin/speedtest-exporter

ENTRYPOINT ["/usr/local/bin/speedtest-exporter"]
# #ENTRYPOINT ["/bin/sh"] #54836