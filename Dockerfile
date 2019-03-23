FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apk add -y \
        mpv \
        python \
        git-core \
        python3-pip \
        python3-setuptools \
    && pip3 install requests pyxdg lxml setuptools

RUN mkdir -p /opt/radio && git clone https://github.com/chronitis/curseradio.git /opt/radio \
    && cd /opt/radio && python3 setup.py build && python3 setup.py install

ENTRYPOINT [ "curseradio" ]