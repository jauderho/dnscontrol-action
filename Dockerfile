FROM ghcr.io/jauderho/dnscontrol:v4.12.0@sha256:11f07a0eacda647b4db53da84cf67644e0ffbbbc36844f0fb30bb5dda22ae6e3

LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk update \
	&& apk upgrade -a \
	&& apk add --no-cache bash

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
