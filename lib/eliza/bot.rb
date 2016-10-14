module Eliza
  class Bot
    def transform(input)
      normalized_input = normalize_text(input)

      normalized_input.split('.').map{|text| Sentence.new(text) }.each do |sentence|
        return final_phrase if sentence.quit?

        'Standard Reply'
      end
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

    def data_path
      @data_path ||= Pathname.new('lib/data/data.yml')
    end

    def data
      @data ||= YAML.load(data_path.read)
    end
  end
end