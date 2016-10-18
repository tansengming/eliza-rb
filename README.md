[![Code Climate](https://codeclimate.com/github/tansengming/eliza-rb/badges/gpa.svg)](https://codeclimate.com/github/tansengming/eliza-rb)
[![Test Coverage](https://codeclimate.com/github/tansengming/eliza-rb/badges/coverage.svg)](https://codeclimate.com/github/tansengming/eliza-rb/coverage)

# ELIZA-rb

A Ruby implementation Joseph Weizenbaum's ELIZA, your friendly neighborhood robo Rogerian psychotherapist.

_This is a work in progress. The rules system needs a bit more optimization before it's ready for 1.0. In the meantime have fun and let me know how it goes._

# Getting Started

## Installing

TBD

## Usage

```ruby
eliza   = Eliza::Bot.new
initial = eliza.initial_phrase
reply   = eliza.transform(input_string)

 # `#transform` returns a final phrase in case of a quit phrase
 # but you can also get a final phrase with:
 final  = eliza.final_phrase
```

## Command Line Interface

If you would like to try chatting with ELIZA you can start her up with the built-in CLI by running:

`./bin/eliza-rb`

# Development

## Approach


# References

- [Joseph Weizenbaum's ACM paper](https://www.csee.umbc.edu/courses/331/papers/eliza.html)
- [mass:werk's Javascript implentation](http://www.masswerk.at/elizabot/)
- [ELIZA on Wikipedia](https://en.wikipedia.org/wiki/ELIZA)