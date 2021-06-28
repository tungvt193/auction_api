FROM ruby:2.6.5

LABEL maintainer="Tai Nguyen Van <tainv.it93@gmail.com>"

ENV INSTALL_PATH /home/auction-api
ENV RAILS_LOG_TO_STDOUT true
ENV GEM_HOME /usr/local/bundle

EXPOSE 3000

WORKDIR $INSTALL_PATH

# Adding gems
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN gem install bundler && \
  bundle install
# Copy all host application's directory to container
COPY . ./