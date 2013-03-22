
require (File.expand_path('../../lib/mogreet', __FILE__))

gem 'minitest'
 
#dependencies
require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'
require 'turn'
 
Turn.config do |c|
 # :outline  - turn's original case/test outline mode [default]
 c.format  = :outline
 # turn on invoke/execute tracing, enable full backtrace
 c.trace   = true
 # use humanized test names (works only with :outline format)
 c.natural = true
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
end

def methods_are_defined(object, methods)
  methods.each do |method|
    object.send("#{method}?").must_equal true
  end  
end