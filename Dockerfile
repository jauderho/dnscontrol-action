FROM ghcr.io/jauderho/dnscontrol:v4.13.0@sha256:d3a33c30d521992f891697116962dfd0db704e5a46c1b7c67ff3ffb2f1974a94

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
