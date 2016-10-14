[![Code Climate](https://codeclimate.com/github/tansengming/eliza-rb/badges/gpa.svg)](https://codeclimate.com/github/tansengming/eliza-rb)

A Ruby implementation Joseph Weizenbaum's ELIZA, your friendly neighborhood robo Rogerian psychotherapist.

# Installation

TBD

# Usage

```ruby
eliza   = ElizaBot.new
initial = eliza.initial_phrase
reply   = eliza.transform(input_string)

 # `#transform` returns a final phrase in case of a quit phrase
 # but you can also get a final phrase with:
 final = eliza.final_phrase
```

# References

- [Joseph Weizenbaum's ACM paper](https://www.csee.umbc.edu/courses/331/papers/eliza.html)
- [mass:werk's Javascript implentation](http://www.masswerk.at/elizabot/)
- [ELIZA on Wikipedia](https://en.wikipedia.org/wiki/ELIZA)