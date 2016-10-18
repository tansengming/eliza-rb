# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eliza/version'

Gem::Specification.new do |spec|
  spec.name          = "eliza"
  spec.version       = Eliza::VERSION
  spec.authors       = ["SengMing Tan"]
  spec.email         = ["sengming@sanemen.com"]

  spec.summary       = %q{ELIZA, your friendly neighborhood robo Rogerian psychotherapist.}
  spec.description   = %q{A Ruby implementation Joseph Weizenbaum's ELIZA, your friendly neighborhood robo Rogerian psychotherapist.}
  spec.homepage      = "https://github.com/tansengming/eliza-rb"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "awesome_print"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "codeclimate-test-reporter"
  spec.add_development_dependency "fuubar"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-its"
  spec.add_development_dependency "tapp"
  spec.add_development_dependency "wirble"
end