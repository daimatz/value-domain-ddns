# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'value-domain-ddns/version'

Gem::Specification.new do |spec|
  spec.name          = "value-domain-ddns"
  spec.version       = ValueDomainDdns::VERSION
  spec.authors       = ["daimatz"]
  spec.email         = ["dai@daimatz.net"]
  spec.description   = %q{value-domain ddns script}
  spec.summary       = %q{automatically updates value-domain ddns}
  spec.homepage      = "https://github.com/daimatz/value-domain-ddns"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", ">= 0.17.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
