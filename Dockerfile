FROM ghcr.io/jauderho/dnscontrol:v4.11.0@sha256:e6ea4794ed04362108ee02fa3fb1edb75948fe5ec48ac3e5e1411739e6374031

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
