FROM ghcr.io/jauderho/dnscontrol:v4.11.0@sha256:5ac9a50811a7e5b0335ab41629b49b8737eaea55c1a36d8648496b417dec34f5

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
