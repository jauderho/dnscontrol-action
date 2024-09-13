FROM ghcr.io/jauderho/dnscontrol:v4.13.0@sha256:6967f3b0c876cda7d6a5421f0478a64b42879afba618c96b4bf148044e4af51d

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
