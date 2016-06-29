FROM ruby:2.1

WORKDIR /app

ADD Gemfile       .
ADD Gemfile.lock  .

ENV BUNDLE_PATH /tmp/bundle
RUN bundle install

ADD . /app

CMD ruby app.rb -o 0.0.0.0
