FROM ruby:2.7.1

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y apt-utils nodejs postgresql-client yarn build-essential vim libpq-dev shared-mime-info
RUN yarn global add n && n stable

ENV APP_ROOT /app

RUN mkdir /app
WORKDIR $APP_ROOT
ADD Gemfile .
ADD Gemfile.lock .

RUN gem update --system && gem install bundler:2.1.4
RUN bundle install

ADD . $APP_ROOT

EXPOSE 3000