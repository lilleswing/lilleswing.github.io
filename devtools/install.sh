#!/bin/bash

wget -O rvm.sh https://get.rvm.io
bash rvm.sh --path `pwd`/.rvm
source "`pwd`/.rvm/scripts/rvm"
rvm install ruby-2.2
rvm use 2.2
gem update --system
gem install bundler
bundle install
bundle exec jekyll build
