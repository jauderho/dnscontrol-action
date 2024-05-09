FROM ghcr.io/jauderho/dnscontrol:v4.10.0@sha256:b2603ba5d0eb09d5df005db25a86609e0c5e7294b719975fc75670d16f366ee2

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
