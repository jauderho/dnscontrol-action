FROM ghcr.io/jauderho/dnscontrol:v4.11.0@sha256:2629869b579a151996cb740f0564d21704414b8e03adf4cc6d6ec8211a265744

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
