FROM ghcr.io/jauderho/dnscontrol:v4.12.5@sha256:764008a45b243e4256fedda5ee7f7549c96d0c818a06f4f901463cb139f85209

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
