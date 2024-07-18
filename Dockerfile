FROM ghcr.io/jauderho/dnscontrol:v4.12.4@sha256:97463831e55e6a7ac1c2bf7e23a11baa42a5f3f24fb1ab86b2068e9634139c77

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
