FROM ghcr.io/jauderho/dnscontrol:v4.12.5@sha256:0a2e6180809b9ac6595a4f921bc689970c98c443c4433caae5bb185582eb2540

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
