$:.unshift File.dirname(__FILE__)
require 'hbaserb/client.rb'
require 'hbaserb/exceptions.rb'
require 'hbaserb/table.rb'

$:.unshift File.join(File.dirname(__FILE__), 'thrift')
require 'hbase.rb'
require 'hbase_constants.rb'
require 'hbase_types.rb'
