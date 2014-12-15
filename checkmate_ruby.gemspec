lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'checkmate_ruby/version'

Gem::Specification.new do |s|
  s.name         = "CheckmateRuby"
  s.version      = Checkmate::VERSION
  s.summary      = "A Ruby wrapper for the Checkmate Partner API"
  s.authors      = "Alex Katkova"
  s.email        = "eng@checkmate.io"
  s.homepage     = "https://partners.checkmate.io/docs"
  s.license      = "MIT"

  s.files        = `git ls-files`.split($/)
  s.required_ruby_version = ">= 1.9.3"
  s.add_development_dependency 'bundler', '~> 1.5'
  s.add_development_dependency 'rspec', '~> 0'

  s.add_runtime_dependency 'hashie', '~> 3.3', '>= 3.3.2'
  s.add_runtime_dependency 'typhoeus', '~> 0.5'
end
