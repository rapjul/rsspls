#!/bin/sh

set -e

trap 'exit' TERM INT

while true; do
  rsspls --config /etc/rsspls.toml
  sleep 1036800 # 12 hours
done
