FROM openjdk:8-jdk

# Build-time metadata in accordance with http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

LABEL org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.name="mat" \
  org.label-schema.description="Eclipse Memory Analyzer for the JVM heap dump analysis" \
  org.label-schema.url="https://github.com/dgroup/mat" \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.vcs-url="https://github.com/dgroup/mat" \
  org.label-schema.vendor="yurii.dubinka@gmail.com" \
  org.label-schema.version=$VERSION \
  org.label-schema.schema-version="1.0" \
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
