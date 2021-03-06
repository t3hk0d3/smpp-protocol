# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'smpp/protocol/version'

Gem::Specification.new do |spec|
  spec.name          = 'smpp-protocol'
  spec.version       = Smpp::Protocol::VERSION
  spec.authors       = ['Igor Yamolov']
  spec.email         = ['iyamolov@spbtv.com']

  spec.summary       = 'SMPP 5.0 native ruby implementation'
  spec.description   = 'Native Ruby implementation of SMPP 5.0 protocol'
  spec.homepage      = 'https://github.com/t3hk0d3/smpp-protocol'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.start_with?('spec/') }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.4'
  spec.add_development_dependency 'rubocop', '~> 0.40'
end
