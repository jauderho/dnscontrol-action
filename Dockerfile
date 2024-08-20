FROM ghcr.io/jauderho/dnscontrol:v4.12.5@sha256:a9dcdc62247c66a77690807e6ca5664b31d7a77f3d6dd5e462f29205980fa6e4

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
