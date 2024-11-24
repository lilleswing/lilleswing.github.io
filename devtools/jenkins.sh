#!/bin/bash
set -xe
bash devtools/set_docker_user.sh
docker compose build
docker compose run jekyll
cd _site
scp -r * karl_leswing@karlleswing.com:/home/karl_leswing/karlleswing.com
