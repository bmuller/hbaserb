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

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.homepage = "http://github.com/bmuller/hbaserb"
  s.add_dependency('thrift', '>= 0.4.0')
  s.rubyforge_project = "hbaserb"
end
