FROM openjdk:8-jdk

LABEL contact="yurii.dubinka@gmail.com" \
  sources="https://github.com/dgroup/mat" \
  dockerfile="https://github.com/dgroup/mat/blob/master/Dockerfile"

ENV MAT_HOME=/mat \
  MAT_DIST=MemoryAnalyzer-1.8.1.20180910-linux.gtk.x86_64.zip

RUN wget https://mirrors.dotsrc.org/eclipse//mat/1.8.1/rcp/${MAT_DIST} \
  && unzip MemoryAnalyzer-1.8.1.20180910-linux.gtk.x86_64.zip \
  && apt-get update \
  && apt-get install --reinstall coreutils \
  && apt-get -y install tree vim dos2unix git subversion \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ${MAT_DIST}

MAINTAINER 'Yurii Dubinka (yurii.dubinka@gmail.com)'
