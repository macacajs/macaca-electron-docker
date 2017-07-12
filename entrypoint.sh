#!/bin/bash

start_xvfb() {
  Xvfb :99 -ac -screen 0 1024x768x8 &
}

npm_install() {
  npm install
}

show_info() {
  node -v
}

main() {
  show_info
  start_xvfb
}

main
exec "$@"
