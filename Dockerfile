FROM ghcr.io/jauderho/dnscontrol:v4.13.0@sha256:a6d007e8e9ad44d96a85ef2b0d03a3f6ffb44bd99b006abad6bf4b5c2bf55237

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
