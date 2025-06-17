#!/bin/bash
set -xe
rm -rf docs
bash devtools/set_docker_user.sh
docker compose build
docker compose run jekyll
mv _site docs
cp -r misc docs
