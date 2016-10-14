module Eliza
  class Sentence
    attr_reader :text

    def initialize(text)
      @text = text
    end

    def quit?
      data['quit_words'].find{|quit_word| text.include? quit_word }
    end

    private
    def data_path
      @data_path ||= Pathname.new('lib/data/data.yml')
    end

    def data
      @data ||= YAML.load(data_path.read)
    end
  end
end