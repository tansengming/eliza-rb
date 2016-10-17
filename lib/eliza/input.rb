module Eliza
  class Input
    attr_reader :text

    def initialize(text)
      @text = text
    end

    def sentences
      normalized_text.split('.').map{|text| Sentence.new(text) }
    end

    private
    def normalized_text
      text.downcase
          .gsub(/@#\$%\^&\*\(\)_\+=~`\{\[\}\]\|:;<>\/\\\t/, ' ')
          .gsub(/\s+-+\s+/, '.')
          .gsub(/\s*[,\.\?!;]+\s*/, '.')
          .gsub(/\s*\bbut\b\s*/, '.')
          .gsub(/\s{2,}/, ' ')
    end
  end
end