#!/bin/bash
bash devtools/set_docker_user.sh
docker compose build
docker compose run jekyll
