# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'reqres/version'

Gem::Specification.new do |spec|
  spec.name          = "reqres"
  spec.version       = Reqres::VERSION
  spec.authors       = ["Anton Versal"]
  spec.email         = ["ant.ver@gmail.com"]
  spec.description   = %q{Request and Response YAML file generator from test.}
  spec.summary       = %q{Request and Response YAML file generator from test.
                          Can be used for creating fake API with sinatra.
                          And for generating API documentation.}
  spec.homepage      = "https://github.com/antonversal/reqres"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
