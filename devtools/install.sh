#!/bin/bash

wget -O rvm.sh https://get.rvm.io
bash rvm.sh --path `pwd`/.rvm
source "`pwd`/.rvm/scripts/rvm"
rvm install ruby-3.0.0
rvm use 3.0.0
gem update --system
gem install bundler
bundle install
bundle exec jekyll build
