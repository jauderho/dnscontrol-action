FROM ghcr.io/jauderho/dnscontrol:v4.12.0@sha256:ae7d12efd3412729603d83430cf5a14c25905a424f06133ea3d57a563d991615

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
