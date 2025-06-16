#!/bin/bash
set -xe
bash devtools/set_docker_user.sh
docker compose build
docker compose run jekyll
cd _site
# Site is in _site
