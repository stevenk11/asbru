FROM debian:buster-slim

RUN sed -i -e "s/deb.debian/ftp.hk.debian/g" /etc/apt/sources.list \
	&& apt-get update && apt-get install -y --no-install-recommends \
	openssh-client \
	perl \
	libgtk3-perl \
	curl \
	ca-certificates \
	&& curl -s https://packagecloud.io/install/repositories/asbru-cm/asbru-cm/script.deb.sh | bash \
	&& apt-get install -y --no-install-recommends \
	asbru-cm \
	&& apt-get purge -y --autoremove curl \
	&& rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["asbru-cm"]
