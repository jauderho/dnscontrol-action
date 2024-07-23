FROM ghcr.io/jauderho/dnscontrol:v4.12.5@sha256:280d760627f35d6d35b301522c4eaa4e48f76f2b9e13cb9500601debf5d6d30b

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
