FROM ghcr.io/jauderho/dnscontrol:v4.12.3@sha256:ed09c75b3062ce7303cc81a5f583eed128ecde393ae481c0edcbb233070aefe0

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
