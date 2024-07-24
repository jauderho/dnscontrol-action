FROM ghcr.io/jauderho/dnscontrol:v4.12.5@sha256:72e0249ec5ad4b19c547cf6155e4ce441c992a4017c5b8aa9fd242888591dd72

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
