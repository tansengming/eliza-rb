module Eliza
  class Sentence
    attr_reader :text

    def initialize(text)
      @text = text.downcase
    end

    def quit?
      data.quit_words.find{|quit_word| text[/\b#{quit_word}\b/] }
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
      if replacement_rule
        replacement_rule.reassemble_for(text)
      elsif grab_all_rule
        grab_all_rule.reassemble_for(text)
      end
    end

    def grab_all_rule
      rules.find{|rule| rule.grab_all? }
    end

    def replacement_rule
      rules.select{|rule| rule.replacements_for(text).any? }
           .reject(&:grab_all?)
           .sample
    end

    def rules
      data.keywords.find{|h| h['keyword'] == keyword}.fetch('rules')
                      .map{|rule| Rule.new(rule['decomp'], rule['reasmb']) }
    rescue NoMethodError
      raise "Could not find rules for '#{keyword}'!"
    end

    def keyword
      @keyword ||= eliza_keywords.find{|eliza_keyword| text[/\b#{eliza_keyword}\b/]}
    end

    def eliza_keywords
      @eliza_keywords ||= data.keywords.sort_by{|keyword| keyword['rank'] }
                                       .reverse
                                       .map{|h| h['keyword'] }
    end

    def final_phrase
      data.finals.sample
    end

    def data
      @data ||= Module.nesting.last.config.data
    end
  end
end