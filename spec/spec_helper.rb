$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'pry'
require 'rspec/its'
require 'tapp'

require 'eliza'