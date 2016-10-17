module Eliza
  class Bot
    def transform(input)
      # TODO: try not do transform all the sentences
      reply = Input.new(input).sentences.map(&:transform).compact.first

      reply || 'Standard Reply'
    end

    def initial_phrase
      data['initials'].sample
    end

    def final_phrase
      data['finals'].sample
    end

    private
    def data
      @data ||= Module.nesting.last.config.data
    end
  end
end