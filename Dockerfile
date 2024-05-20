FROM ghcr.io/jauderho/dnscontrol:v4.11.0@sha256:09309884ce39728954603b25ae730c0d3062e183a0c545a375664278f55b262e

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
