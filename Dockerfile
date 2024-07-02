FROM ghcr.io/jauderho/dnscontrol:v4.12.1@sha256:e9289d789bae1f1f8df899028ed1b2686ae65a0aa50c8718bdb6fe348f972ae4

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
