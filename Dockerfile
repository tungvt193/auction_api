FROM registry.gitlab.com/its-global/biz/auction-api/base

LABEL maintainer="Tai Nguyen Van <tainv.it93@gmail.com>"

ENV INSTALL_PATH /home/auction-api
ENV RAILS_LOG_TO_STDOUT true

WORKDIR $INSTALL_PATH

EXPOSE 3000

# Adding gems
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install

# Copy all host application's directory to container
COPY . ./

RUN chmod +x ./entrypoint.sh