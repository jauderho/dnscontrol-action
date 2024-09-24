FROM ghcr.io/jauderho/dnscontrol:v4.13.0@sha256:67faf43ba44a820612ce98a3aa121dfa9e10d8c37ad58429cef781fbaa4db362

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
