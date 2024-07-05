FROM ghcr.io/jauderho/dnscontrol:v4.12.2@sha256:5f9c3d683ad24aa41b3a57d4e456bee5760a6472012cd1d4826bbaf9f284e5d5

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
