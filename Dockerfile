FROM ghcr.io/jauderho/dnscontrol:v4.12.0@sha256:7bfe3671c7112be298964ddb142301c9fa89e8a3dcd150d224b6e12fcf97dff8

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
