FROM ghcr.io/jauderho/dnscontrol:v4.11.0@sha256:1d0055f29ecef0382b6eb0ba111e5bbd3752e642da2ede7a73b3fb44ba19bb72

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
