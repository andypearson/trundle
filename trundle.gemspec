# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'trundle/version'

Gem::Specification.new do |spec|
  spec.name          = 'trundle'
  spec.version       = Trundle::VERSION
  spec.authors       = ['Andy Pearson']
  spec.email         = ['andy@andy-pearson.com']
  spec.summary       = %q{A gem for reading and writing TextBundle files.}
  spec.description   = %q{A gem for reading and writing TextBundle files.}
  spec.homepage      = 'https://github.com/andypearson/trundle'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end
