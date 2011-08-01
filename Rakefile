require 'rubygems'
require 'bundler'
require 'rake/testtask'
require 'rdoc/task'

Bundler::GemHelper.install_tasks

desc "Create documentation"
RDoc::Task.new("doc") { |rdoc|
  rdoc.title = "HBaseRb - Ruby HBase interface that uses thrift"
  rdoc.rdoc_dir = 'docs'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/hbaserb/*.rb')
}

desc "Re-generate thrift files"
task "regen_thrift" do 
  if ENV['HBASE_HOME'].nil?
    puts "You must set your HBASE_HOME variable before calling this task."
    return
  end
  system "thrift --gen rb -o /tmp #{ENV['HBASE_HOME']}/src/main/resources/org/apache/hadoop/hbase/thrift/Hbase.thrift"
  system "mv /tmp/gen-rb/* lib/thrift"
end
