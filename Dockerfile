FROM ghcr.io/jauderho/dnscontrol:v4.12.4@sha256:8cafe20e8478326e4f28344a58fb43db1976e16830e41d7ef59542bd7c34a534

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
