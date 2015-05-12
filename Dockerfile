FROM ruby:2.2.1
MAINTAINER José Moreira <zemanel@zemanel.eu>

RUN apt-get -y update && apt-get -y upgrade

# Required for Postgresql gems
RUN apt-get -y install postgresql-server-dev-9.4 postgresql-client

# Install app dependencies directly on system Ruby.
# A better defined project could use RVM.

RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install

CMD [ "ruby", "app.rb"]
