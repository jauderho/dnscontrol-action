FROM ghcr.io/jauderho/dnscontrol:v4.10.0@sha256:d5b84ff0e352a62e16053226e97f27d228ab61b48ffd81d8eb8ab5895f132795

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
