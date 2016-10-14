module Eliza
  class Bot
    def transform(input)
      normalized_input = normalize_text(input)

      # TODO: try not do transform all the sentences
      reply = normalized_input.split('.').map{|text| Sentence.new(text) }.map(&:transform).compact.first

      reply || 'Standard Reply'
    end

    def initial_phrase
      data['initials'].sample
    end

    def final_phrase
      data['finals'].sample
    end

    private
    def normalize_text(text)
      text.downcase
          .gsub(/@#\$%\^&\*\(\)_\+=~`\{\[\}\]\|:;<>\/\\\t/, ' ')
          .gsub(/\s+-+\s+/, '.')
          .gsub(/\s*[,\.\?!;]+\s*/, '.')
          .gsub(/\s*\bbut\b\s*/, '.')
          .gsub(/\s{2,}/, ' ')
    end

    def data
      @data ||= Module.nesting.last.config.data
    end
  end
end