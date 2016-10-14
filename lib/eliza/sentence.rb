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
    def data
      @data ||= Module.nesting.last.config.data
    end
  end
end