FROM ghcr.io/jauderho/dnscontrol:v4.12.5@sha256:6d5d465f6193de8d0faf8132d49892004f2bb3f6e8a29b525504a7ce185c6043

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
