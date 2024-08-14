FROM ghcr.io/jauderho/dnscontrol:v4.12.5@sha256:6f6b99d87913ae4e2c1b79be6d1b14386e3bddb0fbba9a44a9fcb7678b2b09ec

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
