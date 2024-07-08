FROM ghcr.io/jauderho/dnscontrol:v4.12.2@sha256:73613a1cfed046ea8a71e8cfd0634453d6fea8ea4793aa7419ba3a9570667955

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
