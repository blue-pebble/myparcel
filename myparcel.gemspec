# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'myparcel/version'

Gem::Specification.new do |spec|
  spec.name          = 'myparcel'
  spec.version       = Myparcel::VERSION
  spec.authors       = ['Ivan Malykh']
  spec.email         = ['ivan@lesslines.com']

  spec.summary       = 'MyParcel API Ruby wrapper.'
  spec.description   = 'Ruby wrapper for MyParcel API.'
  spec.homepage      = 'https://github.com/ivdma/myparcel'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'httparty',           '~> 0.14'
  spec.add_dependency 'virtus'

  spec.add_development_dependency 'bundler',       '~> 1.12'
  spec.add_development_dependency 'rake',          '~> 10.0'
  spec.add_development_dependency 'rspec',         '~> 3.0'
  # spec.add_development_dependency 'guard-bundler', '~> 2.1'
  # spec.add_development_dependency 'guard-rspec',   '~> 4.7'
  # spec.add_development_dependency 'guard-rubocop'
  # spec.add_development_dependency 'rubocop',       '~> 0.42'
  spec.add_development_dependency 'webmock',       '~> 1.24'
  spec.add_development_dependency 'vcr',           '~> 3.0'
  spec.add_development_dependency 'pry',           '~> 0.10'
  spec.add_development_dependency 'timecop',       '~> 0.8'
  spec.add_development_dependency 'dotenv',        '~> 2.1'
end
