[![Code Climate](https://codeclimate.com/github/tansengming/eliza-rb/badges/gpa.svg)](https://codeclimate.com/github/tansengming/eliza-rb)
[![Test Coverage](https://codeclimate.com/github/tansengming/eliza-rb/badges/coverage.svg)](https://codeclimate.com/github/tansengming/eliza-rb/coverage)

# ELIZA-rb

A Ruby implementation Joseph Weizenbaum's ELIZA, your friendly neighborhood robo Rogerian psychotherapist.

_This is a work in progress. The rules needs a bit more work before it's ready for 1.0. In the meantime have fun and let me know how it goes._

This is what it looks like chatting with her,

```
ELIZA: Please tell me what's been bothering you.
I have problems sleeping every night. 
ELIZA: That's quite interesting.
It's not really interesting. More bothersome than anything. 
ELIZA: What does that suggest to you?
I think it means that I've been having bad dreams. 
ELIZA: You say you think it means that you've been having bad dreams?
Yes, exactly. 
ELIZA: I understand.
But how can you? You're a computer!
ELIZA: What about machines worries you?
```

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

You can chat with ELIZA on the CLI by running:

`./bin/eliza-rb`

## Docker

If you already have Docker installed, here's how you can get started:

- `docker build -t eliza-rb github.com/tansengming/eliza-rb`
- `docker run -it eliza-rb`

# Development

## Approach

ELIZA works by matching keywords and using those keywords to form replies with [a bunch of rules](lib/data/data.yml):

Let's say `forget` is a keyword with decomposition and reassembly rules that look like this:

```yaml
{
  decomposition_pattern: "* i forget *"
  reassembly_pattern: Can you think of why you might forget \2?
}

```

If we start off with a sentence like:

> **What if** I forget **about the kettle**?

Applying the rules would create this reply:

> Can you think of why you might forget **about the kettle**?

## References

- [Joseph Weizenbaum's ACM paper](https://www.csee.umbc.edu/courses/331/papers/eliza.html)
- [mass:werk's Javascript implentation](http://www.masswerk.at/elizabot/)
- [ELIZA on Wikipedia](https://en.wikipedia.org/wiki/ELIZA)
