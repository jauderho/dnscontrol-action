FROM ghcr.io/jauderho/dnscontrol:v4.13.0@sha256:0d007449fdbadac98ea6b15ceec4469bfe79224e0df4b634121103a6b2188469

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
