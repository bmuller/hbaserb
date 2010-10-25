Gem::Specification.new do |s|
  s.name = "hbaserb"
  s.version = "0.0.1"
  s.authors = ["Brian Muller"]
  s.date = %q{2010-10-25}
  s.description = "HBase Thrift interface for Ruby"
  s.summary = "Simple lib for interfaceing with HBase via Ruby and Thrift."
  s.email = "bamuller@gmail.com"
  s.files = [
    "lib/hbaserb.rb",
    "lib/hbaserb/client.rb",
    "lib/hbaserb/exceptions.rb",
    "lib/hbaserb/scanner.rb",
    "lib/hbaserb/table.rb",
    "lib/thrift/hbase.rb",
    "lib/thrift/hbase_constants.rb",
    "lib/thrift/hbase_types.rb"
  ]
  s.homepage = "http://github.com/bmuller/hbaserb"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.3.5"
  s.add_dependency('thrift', '>= 0.4.0')
end