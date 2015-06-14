FROM ubuntu:15.04
MAINTAINER Vytautas Astrauskas "vastrauskas@gmail.com"

RUN apt-get update && apt-get install -y \
      gnupg pbuilder devscripts debhelper \
      git \
      build-essential && \
      apt-get clean

RUN mkdir -p /home/maintainer && \
    echo "maintainer:x:1000:1000:Maintainer,,,:/home/maintainer:/bin/bash" >> /etc/passwd && \
    echo "maintainer:x:1000:" >> /etc/group && \
    chown maintainer:maintainer -R /home/maintainer
USER maintainer
ENV HOME /home/maintainer
WORKDIR /home/maintainer/workspace
CMD /bin/bash
