FROM ghcr.io/jauderho/dnscontrol:v4.12.5@sha256:fe27274d8cd415f62198ce56b7884df788f689cddd36b7c2a359e7aadceef333

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
