# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mogreet/version"

Gem::Specification.new do |s|
  s.name        = "mogreet"
  s.version     = Mogreet::VERSION
  # who wants to join me?
  s.authors     = ["Paul Forsyth"]
  s.email       = ["paul@mogreet.com"]
  # for now
  s.homepage    = "https://github.com/pforsyth/mogreet"
  s.summary     = %q{Ruby interface to the Mogreet API}
  s.description = %q{Ruby interface to the Mogreet API. Allows sending SMS and MMS messages. Go to https://developer.mogreet.com to create an account.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "rest-client"
  s.add_runtime_dependency "hashie"
end
