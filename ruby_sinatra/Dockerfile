FROM ruby:2.1

RUN apt-get install -y git

RUN mkdir /app
WORKDIR /app
ADD . /app

ENV BUNDLE_PATH /tmp/bundle

RUN bundle install
CMD ./run_app.sh
