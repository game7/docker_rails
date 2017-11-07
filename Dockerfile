FROM ruby:2.3.3
ENV http_proxy="http://proxy-us.intel.com:911"
ENV https_proxy="http://proxy-us.intel.com:912"
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp