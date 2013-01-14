# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sambatech/version"

Gem::Specification.new do |s|
  s.add_development_dependency('rake', '~> 10.0.3')
  s.add_development_dependency('rspec', '~> 2.11.0')
  s.add_development_dependency('webmock', '~> 1.6')
  s.add_development_dependency('bluecloth', '~> 2.0.11')
  s.add_runtime_dependency('faraday', ['>= 0.8.4', '< 0.9'])
  s.add_runtime_dependency('faraday_middleware', ['>= 0.9.0', '< 0.10'])
  s.add_runtime_dependency('multi_xml', ['~> 0.5.1'])
  s.add_runtime_dependency('hashie', ['~> 1.2.0'])
  s.add_runtime_dependency('rash', ['~> 0.3.2'])
  s.name        = 'sambatech'
  s.version     = Sambatech::VERSION.dup
  s.date        = '2012-12-05'
  s.summary     = %q{Ruby wrapper for the Sambatech API}
  s.description = "A simple hello world gem"
  s.authors     = ["Lindolfo 'Lorn' Rodrigues"]
  s.email       = 'lorn@lornlab.org'
  s.files       = `git ls-files`.split("\n")
  s.homepage    = 'http://rubygems.org/gems/sambatech'
end