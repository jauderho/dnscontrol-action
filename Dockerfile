FROM ghcr.io/jauderho/dnscontrol:v4.11.0@sha256:9caae2b593376f8cdaf9f8cee98b7a0eb32d8a415fe1b53c05a82c9a41d5293c

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
