FROM ghcr.io/jauderho/dnscontrol:v4.10.0@sha256:da925be95646454a651312f22f91be07dc40531814b0f9fc6b403ae8ffa4cb04

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
