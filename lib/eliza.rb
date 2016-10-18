require 'pathname'
require 'yaml'

require "eliza/version"
require "eliza/input"
require "eliza/sentence"
require 'eliza/rule'
require "eliza/bot"

module Eliza
  class Configuration
    attr_accessor :data_path

    def initialize
      @data_path = 'lib/data/data.yml'
    end

    def reset
      @data = nil
      @data_path = 'lib/data/data.yml'
    end

    def data_pathname
      Pathname.new(data_path)
    end

    def data
      @data ||= YAML.load(data_pathname.read)
    end
  end

  def self.configure
    @config ||= Configuration.new
    yield(@config) if block_given?
    @config
  end

  def self.config
    @config || configure
  end
end