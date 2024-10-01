FROM ghcr.io/jauderho/dnscontrol:v4.13.0@sha256:3ec8a5e8395d39039caf5ecdd059af428d8d37ef922a4bf82f91094b95f29949

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
