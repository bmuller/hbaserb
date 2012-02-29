$:.push File.expand_path("../lib", __FILE__)
require "hbaserb/version"
require "date"

Gem::Specification.new do |s|
  s.name = "hbaserb"
  s.version = HBaseRB::VERSION
  s.authors = ["Brian Muller"]
  s.date = Date.today.to_s
  s.description = "Ruby HBase library using Thrift"
  s.summary = "Simple lib for interfaceing with HBase via Ruby and Thrift."
  s.email = "brian.muller@livingsocial.com"
  s.files = FileList["lib/**/*", "[A-Z]*", "Rakefile", "docs/**/*"]
  s.homepage = "http://github.com/bmuller/hbaserb"
  s.require_paths = ["lib"]
  s.add_dependency('thrift', '>= 0.4.0')
  s.rubyforge_project = "hbaserb"
end
