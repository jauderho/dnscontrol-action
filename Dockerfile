FROM ghcr.io/jauderho/dnscontrol:v4.12.5@sha256:75f4bce019c6336d843ec9bda40982628f1be6e7e1f38a19db8b98ed1a3328b0

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
