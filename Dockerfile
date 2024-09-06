FROM ghcr.io/jauderho/dnscontrol:v4.13.0@sha256:3e72a7a9d0e50e53b7579da74385c4f4217ea74adc645165cd6e56c0e5552f42

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
