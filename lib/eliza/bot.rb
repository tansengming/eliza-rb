module Eliza
  class Bot
    def initialize
    end

    def initial_phrase
      initial_phrases.sample
    end

    def final_phrase
      final_phrases.sample
    end

    private
    def initial_phrases
      YAML.load(initial_phrases_yaml_path.read)
    end

    def initial_phrases_yaml_path
      @initial_phrases_yaml_path ||= Pathname.new('lib/data/eliza_initials.yml')
    end

    def final_phrases
      YAML.load(final_phrases_yaml_path.read)
    end

    def final_phrases_yaml_path
      @final_phrases_yaml_path ||= Pathname.new('lib/data/eliza_finals.yml')
    end
  end
end