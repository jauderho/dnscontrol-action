FROM ghcr.io/jauderho/dnscontrol:v4.11.0@sha256:9ae1217d90c9858482b069c76b089dee46330d92b58d40fe220b44a75a1e1f17

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
