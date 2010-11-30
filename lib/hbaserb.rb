require 'hbaserb/client'
require 'hbaserb/exceptions'
require 'hbaserb/table'
require 'hbaserb/scanner'
require 'hbaserb/extensions'

$:.unshift File.join(File.dirname(__FILE__), 'thrift')
require 'hbase'
require 'hbase_constants'

