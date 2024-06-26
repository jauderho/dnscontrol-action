FROM ghcr.io/jauderho/dnscontrol:v4.12.0@sha256:339a84dde8d338b7c3988bbd37c0bb802e49256272ed0befd8da7197b3c375a4

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
