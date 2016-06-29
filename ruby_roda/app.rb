require 'bundler'
Bundler.require :default

class App < Roda
  route do |r|
    r.root do
      "Hello world!"
    end
  end
end
