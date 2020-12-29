#!/bin/bash
source /var/lib/jenkins/.rvm/scripts/rvm
rvm install ruby-3.0.0
rvm use 3.0.0
gem update --system
gem install bundler
bundle install
bundle exec jekyll build
