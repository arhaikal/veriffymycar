FROM ruby:alpine

RUN apk add --update build-base postgresql-dev tzdata imagemagick
RUN gem install rails -v '5.2.2.1'

WORKDIR /app
ADD Gemfile Gemfile.lock /app/
RUN bundle install