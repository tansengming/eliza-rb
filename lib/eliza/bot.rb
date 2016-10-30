module Eliza
  class Bot
    def initialize
      @bye = false
    end

    def transform(input)
      @bye = Input.new(input).sentences.map(&:quit?).any?

      reply_by_keyword(input) || reply_without_keyword
    end

    def initial_phrase
      data.initials.sample
    end

    def final_phrase
      data.finals.sample
    end

    def bye?
      @bye
    end

    private
    def reply_without_keyword
      data.keywords.find{|keyword| keyword['keyword'] == 'xnone' }['rules'].first['reasmb'].sample
    end

    # TODO: try not do transform all the sentences
    def reply_by_keyword(input)
      Input.new(input).sentences.map(&:transform).compact.first
    end

    def data
      @data ||= Module.nesting.last.config.data
    end
  end
end