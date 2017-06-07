FROM node:6

COPY sources.list /etc/apt/sources.list

RUN apt-get update && apt-get install -y --no-install-recommends \
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
      fonts-droid \
      ttf-wqy-zenhei \
      ttf-wqy-microhei \
      fonts-arphic-ukai \
      fonts-arphic-uming
