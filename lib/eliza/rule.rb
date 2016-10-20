module Eliza
  class Rule
    attr_reader :decompostion_pattern, :reassembly_patterns
    def initialize(decompostion_pattern, reassembly_patterns)
      @decompostion_pattern = decompostion_pattern.strip
      @reassembly_patterns  = reassembly_patterns
    end

    # TODO: plz hlp this is terrible
    # e.g. 'i think i remember that'.scan'(.*) i remember (.*)' -> ['i think', 'that']
    def replacements_for(text)
      (text.scan(/#{decompostion_regex}/).last || []).map do |replacement|
        data['posts'].find {|from, to| replacement.gsub!(/\b#{from}\b/, to) }
        replacement
      end
    end

    def reassemble_for(text)
      pattern.gsub(/\\(\d+)/) { |_match| replacements_for(text)[$1.to_i - 1] }
    end

    def pattern
      reassembly_patterns.sample
    end

    def grab_all?
      decompostion_pattern == '*'
    end

    private
    # e.g. '* i remember *' -> '(.*) i remember (.*)'
    def decompostion_regex
      return '^(.*)$' if grab_all?

      decompostion_pattern.gsub(/^\*\s+/, '(.*)\b')
                          .gsub(/\s+\*/, ' (.*)')
    end

    def data
      @data ||= Module.nesting.last.config.data
    end
  end
end