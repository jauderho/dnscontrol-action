FROM ghcr.io/jauderho/dnscontrol:v4.11.0@sha256:f032b6e16b3b1265eec01d5028ea0d5501506b573701eed4c5edd5b3a21d156d

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
