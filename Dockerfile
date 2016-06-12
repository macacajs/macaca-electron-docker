FROM debian:jessie

COPY sources.list /etc/apt/sources.list
COPY .bashrc /root/

ENV NODE_VERSION=4.2.3 \
    NODE_REGISTRY=https://npm.taobao.org/mirrors/node \
    CHROMEDRIVER_CDNURL=http://npm.taobao.org/mirrors/chromedriver/ \
    ELECTRON_MIRROR=https://npm.taobao.org/mirrors/electron/ \
    JAVA_HOME='/usr/lib/jvm/java-8-openjdk-amd64' \
    DISPLAY=':99.0' \
    NODE_IN_DOCKER=1

RUN apt-get update && apt-get install -y --no-install-recommends \
      ca-certificates \
      curl \
      git \
      ssh \
      openjdk-8-jdk \
      xvfb \
      libxtst6 \
      libgtk2.0 \
      libgconf2-dev \
      libasound2 \
      libxss1 \
      libnss3 \
      xauth \
      libnotify-dev \
      make \
      fonts-droid ttf-wqy-zenhei ttf-wqy-microhei fonts-arphic-ukai fonts-arphic-uming \
      && rm -rf /var/lib/apt/lists/* \
      && curl -SLO "$NODE_REGISTRY/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" \
      && tar -xzf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1 \
      && rm "node-v$NODE_VERSION-linux-x64.tar.gz" \
      && npm install -g cnpm --registry=http://registry.npm.taobao.org
