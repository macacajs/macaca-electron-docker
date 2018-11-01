FROM scratch

ADD rootfs.tar.xz /

COPY sources.list /etc/apt/sources.list
# Freeze Dependencies and Cache Layer
RUN apt-get update && apt-get install -y --no-install-recommends \
      -t jessie-backports \
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
      fonts-droid ttf-wqy-zenhei ttf-wqy-microhei fonts-arphic-ukai fonts-arphic-uming fonts-tlwg-garuda \
      && rm -rf /var/lib/apt/lists/*

# Variable Layer: Node.js etc.
ENV NODE_VERSION=8.12.0 \
    NODE_REGISTRY=https://npm.taobao.org/mirrors/node \
    CHROMEDRIVER_CDNURL=http://npm.taobao.org/mirrors/chromedriver/ \
    ELECTRON_MIRROR=https://npm.taobao.org/mirrors/electron/ \
    JAVA_HOME='/usr/lib/jvm/java-8-openjdk-amd64' \
    DISPLAY=':99.0' \
    NODE_IN_DOCKER=1

RUN curl -SLO "$NODE_REGISTRY/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" \
      && tar -xzf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1 \
      && rm "node-v$NODE_VERSION-linux-x64.tar.gz"

COPY entrypoint.sh /root/entrypoint.sh

WORKDIR /root

ENTRYPOINT ["./entrypoint.sh"]

CMD ["/bin/bash"]
