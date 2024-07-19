FROM ghcr.io/jauderho/dnscontrol:v4.12.5@sha256:819c030f7a9da5799bdd9b689652bd4775dabd9fe263da7915cdf18c46c42281

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
