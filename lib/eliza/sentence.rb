module Eliza
  class Sentence
    attr_reader :text

    def initialize(text)
      @text = text.downcase
    end

    def transform
      if quit?
        final_phrase
      elsif keyword
        transform_by_rule
      else
        nil
      end
    end

    private
    def transform_by_rule
      if replacements?
        rule['reasmb'].sample.gsub(/\\(\d+)/) do |_match|
          replacements[$1.to_i - 1]
        end
      else
        rule['reasmb'].sample
      end
    end

    # e.g. '* i remember *' -> '(.*) i remember (.*)'
    def desamb_regex
       rule['decomp'].gsub(/\*/, '(.*)')
    end

    # e.g. 'i think i remember that'.scan'(.*) i remember (.*)' -> ['i think', 'that']
    def replacements
      text.scan(/#{desamb_regex}/).last
    end


    def replacements?
      replacements.size > 0
    end

    def rule
      data['keywords'].find{|h| h['keyword'] == keyword}.fetch('rules').first
    end

    def keyword
      @keyword ||= eliza_keywords.find{|eliza_keyword| text[/\b#{eliza_keyword}\b/]}
    end

    def eliza_keywords
      @eliza_keywords ||= data['keywords'].sort_by{|keyword| keyword['rank'] }.reverse.map{|h| h['keyword'] }
    end

    def final_phrase
      data['finals'].sample
    end

    def quit?
      data['quit_words'].find{|quit_word| text.include? quit_word }
    end

    def data
      @data ||= Module.nesting.last.config.data
    end
  end
end