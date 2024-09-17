FROM ghcr.io/jauderho/dnscontrol:v4.13.0@sha256:b3e9305043cb16b5258b7f79846ec0151b88dd498198226e248160a5a242d728

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
