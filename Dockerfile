FROM ghcr.io/jauderho/dnscontrol:v4.10.0@sha256:bf877d4c410a5c97ea8b730f168fa2c36917b7e73c5a56f1f07c9adb2255e7d4

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
