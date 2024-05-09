FROM ghcr.io/jauderho/dnscontrol:v4.9.0@sha256:adc4021626160cac9c7f94e77fdf9915f859ab86eb52f14508d1318a90a8d1ce

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
