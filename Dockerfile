FROM ghcr.io/jauderho/dnscontrol:v4.13.0@sha256:0bc3ef5821759b28333229015c7b5ddd3e821e51aafe17ec93df8a6dddf0a6d6

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
