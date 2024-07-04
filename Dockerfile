FROM ghcr.io/jauderho/dnscontrol:v4.12.2@sha256:e1d40ffbab9952169d8ea27b1e947c44f643f459ec611903a90e5d18a81e38f1

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
