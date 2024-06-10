FROM ghcr.io/jauderho/dnscontrol:v4.11.0@sha256:41f9dc6398dcee3a4b2183388070f4e0427bcd94cccec6f68794300496515c22

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
