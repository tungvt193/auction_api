FROM ruby:2.6.5

LABEL MAINTAINER="Tai Nguyen<tainv@its-global.vn>"

WORKDIR /

ADD Gemfile .
ADD Gemfile.lock .

RUN gem install bundler --no-document && \
  bundle install && \
  apt-get update && apt-get -y install openssh-client