# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gmaps/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "gmaps-rails"
  spec.version       = GMaps::Rails::VERSION
  spec.authors       = ["Kentaro Imai"]
  spec.email         = ["kentaroi@gmail.com"]
  spec.summary       = %q{gmaps-rails is a gem which includes GMaps.js and provides an easy way to use it in Rails}
  spec.description   = %q{gmaps-rails is a gem which includes GMaps.js and provides an easy way to use it in Rails. GMaps.js has over 4,000 stars on Github and you will love to use it with Rails.}
  spec.homepage      = "https://github.com/kentaroi/gmaps-rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
