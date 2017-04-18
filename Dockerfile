FROM node:7.9.0
MAINTAINER Roman Dutchak <rd@newagesol.com>

RUN echo "deb http://httpredir.debian.org/debian jessie-backports main non-free" >> /etc/apt/sources.list && \
    echo "deb-src http://httpredir.debian.org/debian jessie-backports main non-free" >> /etc/apt/sources.list && \
    echo "deb http://ftp.de.debian.org/debian jessie main" >> /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -y \
        ffmpeg \
        netcat-traditional

RUN yarn global add nightwatch@'<1.0'

WORKDIR /opt/test

COPY wait-for.sh /usr/local/bin/wait-for
COPY entrypoint.sh /usr/local/bin/entrypoint

ENTRYPOINT ["entrypoint"]
