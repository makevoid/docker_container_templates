require 'bundler'
Bundler.require :default

# class App < Sinatra::Application

redis = Redis.new host: "redis",
                  port: "6379"
# R = Redis.new

get "/" do
  # times = redis.get 'hits'
  times = redis.incr 'hits'
  "Hello World! I have been seen #{times} times."
end


# end

# config.ru
#
# require_relative './app'
# run App
