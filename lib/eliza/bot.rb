module Eliza
  class Bot
    def initial_phrase
      data['initials'].sample
    end

    def final_phrase
      data['finals'].sample
    end

    private
    def initial_phrases
      YAML.load(initial_phrases_yaml_path.read)
    end

    def data_path
      @data_path ||= Pathname.new('lib/data/data.yml')
    end

    def data
      @data ||= YAML.load(data_path.read)
    end
  end
end