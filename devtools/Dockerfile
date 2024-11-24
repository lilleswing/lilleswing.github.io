FROM ruby:3.0.0

RUN apt-get update -yq \
  && apt-get install -yq --no-install-recommends \
    build-essential \
  && rm -rf /var/lib/apt/lists/*

RUN gem update --system
RUN gem install bundler
RUN mkdir /app
COPY Gemfile /app/Gemfile
RUN cd /app && bundle install
