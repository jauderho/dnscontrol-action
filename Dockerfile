FROM ghcr.io/jauderho/dnscontrol:v4.12.5@sha256:ecd593493fd15fb415404e7993267a93eec725d34b5f1fd6d7bf07a0a6a66f09

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
