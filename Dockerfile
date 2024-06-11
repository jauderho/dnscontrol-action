FROM ghcr.io/jauderho/dnscontrol:v4.11.0@sha256:b77cb79156a303f85cd05029b41c5cb9038d9f89ce5a89de0f1dfdac60f104e3

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
