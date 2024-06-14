FROM ghcr.io/jauderho/dnscontrol:v4.11.0@sha256:14c2c7c4354ff4b45ef4dc8330d12aa00ad692f6930695bc9cccc7e9fcf3b4af

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
