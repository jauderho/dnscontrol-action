FROM ghcr.io/jauderho/dnscontrol:v4.12.2@sha256:d0efede8a4ea572ddceaceb15b1dd1df230e5da90d451537acb996d0af7d3c27

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
