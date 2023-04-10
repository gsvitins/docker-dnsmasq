#!/bin/sh

if [ -z "$(pgrep dnsmasq)" ]; then
  echo "dnsmasq process is not running!"
  exit 1
fi

if [ -z "$(netstat -tlpn |grep \:53)" ]; then
  echo "nothing is listening on port 53"
  exit 1
fi
