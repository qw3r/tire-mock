# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

require 'tire/mock/version'

Gem::Specification.new do |s|
  s.name        = 'tire-mock'
  s.version     = Tire::Mock::VERSION
  s.summary     = "Tire Mock"
  s.description = "A simple HTTP::Client for mocking ElasticSearch responses"
  s.authors     = ["Istvan Demeter"]
  s.email       = 'demeter.istvan@gmail.com'
  s.homepage    = 'http://github.com/qw3r/tire-mock'
  s.license     = 'MIT'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.add_dependency "tire"

  s.add_development_dependency "rspec"
end
