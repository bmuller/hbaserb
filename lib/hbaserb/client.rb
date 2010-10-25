module HBaseRb
  
  class Client
    def initialize(server, port=9090)
      socket = Thrift::Socket.new(server, port)
      transport = Thrift::BufferedTransport.new(socket)
      transport.open
      protocol = Thrift::BinaryProtocol.new(transport)
      @client = Apache::Hadoop::Hbase::Thrift::Hbase::Client.new(protocol)
    end

    def table_names
      @client.getTableNames
    end

    def has_table?(name)
      table_names.include? name
    end

    def get_table(tablename)
      raise HBaseRb::NoSuchTable if not has_table? tablename
      HBaseRb::Table.new @client, tablename
    end

    def create_table(tablename, *column_family_names)
      column_family_names.map! { |name| Apache::Hadoop::Hbase::Thrift::ColumnDescriptor.new(:name => name) }
      @client.createTable tablename, column_family_names
      get_table tablename
    end

  end

end
