FROM ghcr.io/jauderho/dnscontrol:v4.13.0@sha256:c570596d2192053875b7e01c72203372fc138c5b275ef36cca71323d5b4019bc

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
