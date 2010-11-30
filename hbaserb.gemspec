Gem::Specification.new do |s|
  s.name = "hbaserb"
  s.version = "0.0.1"
  s.authors = ["Brian Muller"]
  s.date = %q{2010-10-25}
  s.description = "HBase Thrift interface for Ruby"
  s.summary = "Simple lib for interfaceing with HBase via Ruby and Thrift."
  s.email = "bamuller@gmail.com"
  s.files = Dir.glob("lib/**/*")
  s.homepage = "http://github.com/bmuller/hbaserb"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.3.5"
  s.add_dependency('thrift', '>= 0.4.0')
end