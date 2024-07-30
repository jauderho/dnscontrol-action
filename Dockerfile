FROM ghcr.io/jauderho/dnscontrol:v4.12.5@sha256:4183546c9edd87651576301c0b8b0f52dfe87b448a474f6fb5b5426d45b73a96

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
