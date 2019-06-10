FROM ruby:2.6.0

# RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

WORKDIR /repo

ENV BUNDLE_PATH='vendor/bundle'

COPY Gemfile Gemfile.lock /repo/
RUN gem install bundler
RUN bundle install

