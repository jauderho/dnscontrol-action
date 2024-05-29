FROM ghcr.io/jauderho/dnscontrol:v4.11.0@sha256:462a87c57fb88d5632918a938e182a70bfc956363170bbabe016ab5dd45ef3a3

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
