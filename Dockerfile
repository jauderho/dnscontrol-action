FROM ghcr.io/jauderho/dnscontrol:v4.12.5@sha256:2f88893cd71441b821403a535dbde2b055db669758c5ed6fdb11e84748123e14

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
