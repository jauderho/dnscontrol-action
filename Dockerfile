FROM ghcr.io/jauderho/dnscontrol:v4.12.5@sha256:ecbc1b86b785efeee98a2e07750dc36acadf8e7b65d520d914f4cfd885029ed5

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
