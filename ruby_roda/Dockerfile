FROM ruby:2.3.3-alpine

# RUN apt-get install -y git

WORKDIR /app

ADD Gemfile      /app/
ADD Gemfile.lock /app/

RUN bundle --without development test --jobs 8

ADD . /app

CMD ./run_app
