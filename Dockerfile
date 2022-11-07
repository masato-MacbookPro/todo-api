FROM ruby:2.7.6

RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install vim -y --no-install-recommends\
  nodejs \
  yarn \
  mariadb-client  \
  build-essential  \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ENV TZ Asia/Tokyo

WORKDIR /todo-api

COPY Gemfile /todo-api/Gemfile
COPY Gemfile.lock /todo-api/Gemfile.lock

RUN gem install bundler
RUN bundle install
RUN yarn install --check-files

COPY . /todo-api
