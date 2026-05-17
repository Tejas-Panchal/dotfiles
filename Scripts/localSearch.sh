#!/bin/zsh

# to start SearXNG
sudo -H -u searxng -i
cd /usr/local/searxng/searxng-src
flask --app searx.webapp run --reload --host 0.0.0.0 --port 8888

# export SEARXNG_SETTINGS_PATH="/etc/searxng/settings.yml"
# python searx/webapp.py
