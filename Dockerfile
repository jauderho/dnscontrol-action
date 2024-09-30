FROM ghcr.io/jauderho/dnscontrol:v4.13.0@sha256:3b07cfd8cc628918be6d3b80aa0185afd8d76a79238b38a60ea097d35568eb9e

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
