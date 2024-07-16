FROM ghcr.io/jauderho/dnscontrol:v4.12.4@sha256:170fb7f198287e3f42e877c8ef7589654775f9de404aa043baa8f1d617148472

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
