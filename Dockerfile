FROM ruby:2.6.4
RUN apt-get update
RUN apt-get install default-mysql-client-core -y
RUN apt-get install rsyslog  -y
RUN mkdir /teste
WORKDIR /teste
ADD Gemfile /teste/Gemfile
ADD Gemfile.lock /teste/Gemfile.lock
RUN bundle install
