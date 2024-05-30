FROM ghcr.io/jauderho/dnscontrol:v4.11.0@sha256:fae6f3d503762ca9e877e2771cdef948016b8c29977c72aef4e2afe7843cb2df

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
