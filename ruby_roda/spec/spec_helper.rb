# environment variable
REBUILD = (ENV["REBUILD"] == "1") # defaults to false

# config
ENV["RACK_ENV"] ||= 'test'

# load the app's environment
require_relative '../env'


# rspec main config
RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :should
  end
end


# spec libs
require 'httparty' # needed for compose
require_relative 'lib/compose'
include ComposeSpecLib

# other configs / setup code can be added here

# ...
