FROM ghcr.io/jauderho/dnscontrol:v4.12.5@sha256:250e3b4487565d158e16fa11c94575a0a1e4ecf4fc8f07f60c0bf59f69d49277

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
