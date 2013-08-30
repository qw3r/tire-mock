Gem::Specification.new do |s|
  s.name        = 'tire-mock'
  s.version     = '0.0.2'
  s.date        = '2013-08-30'
  s.summary     = "Tire Mock"
  s.description = "A simple HTTP::Client for mocking ElasticSearch responses"
  s.authors     = ["Istvan Demeter"]
  s.email       = 'demeter.istvan@gmail.com'
  s.files       = `git ls-files`.split("\n")
  s.homepage    = 'http://github.com/qw3r/tire-mock'
  s.license       = 'MIT'

  s.add_dependency "tire"
end
