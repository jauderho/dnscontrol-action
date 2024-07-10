FROM ghcr.io/jauderho/dnscontrol:v4.12.4@sha256:270af8eddfaa4906485d4b107b5b018752d210b7dfb1fce7b897aabf6ad41c16

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
