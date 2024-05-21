FROM ghcr.io/jauderho/dnscontrol:v4.11.0@sha256:fd9fb7d6dcb225ce35a9711a31e6bdcf35b4bf86a38bec10693a414bec401bee

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
