module Eliza
  class Rule
    attr_reader :decompostion_pattern, :reassembly_patterns
    def initialize(decompostion_pattern, reassembly_patterns)
      @decompostion_pattern = decompostion_pattern.strip
      @reassembly_patterns  = reassembly_patterns
    end

    # e.g. 'i think i remember that'.scan'(.*) i remember (.*)' -> ['i think', 'that']
    def replacements_for(text)
      return [] if default?

      text.scan(/#{decompostion_regex}/).last || []
    end

    def reassemble_for(text)
      return reassembly_patterns.sample if default?
      
      reassembly_patterns.sample.gsub(/\\(\d+)/) do |_match|
        replacements_for(text)[$1.to_i - 1]
      end
    end

    def default?
      decompostion_pattern == '*'
    end

    private
    # e.g. '* i remember *' -> '(.*) i remember (.*)'
    def decompostion_regex
      decompostion_pattern.gsub(/^\*\s+/, '(.*)\b')
                          .gsub(/\s+\*/, ' (.*)')
    end
  end
end