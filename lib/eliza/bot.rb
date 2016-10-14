module Eliza
  class Bot
    def initialize
    end

    def initial_phrase
      initial_phrases.sample
    end

    private
    def initial_phrases
      YAML.load(initial_phrases_yaml_path.read)
    end

    def initial_phrases_yaml_path
      @initial_phrases_yaml_path ||= Pathname.new('lib/data/eliza_initials.yml')
    end
  end
end