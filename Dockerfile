FROM ghcr.io/jauderho/dnscontrol:v4.12.5@sha256:275a8d6c823eacc1578a7df56657936d00015f1e99b78c9acbbced6b5918f6c0

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
