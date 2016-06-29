require 'bundler'
Bundler.require :default

class App < Sinatra::Base
  get '/' do
    "hello world"
  end
end
