$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'simplecov'
SimpleCov.start

require 'pry'
require 'rspec/its'
require 'tapp'

require 'eliza'