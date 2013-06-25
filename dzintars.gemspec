# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dzintars/version'

Gem::Specification.new do |spec|
  spec.name          = "dzintars"
  spec.version       = Dzintars::VERSION
  spec.authors       = ["Raimonds Simanovskis"]
  spec.email         = ["raimonds.simanovskis@gmail.com"]
  spec.description   = %q{Programmēšanas valoda Dzintars}
  spec.summary       = %q{Programmēšanas valoda Dzintars ir Ruby ar latviešu sintaksi.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "ruby2ruby"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
