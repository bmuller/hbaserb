module HBaseRb
  
  class Table
    def initialize(client, name)
      @client = client
      @name = name
    end

    def column_families
      call :getColumnDescriptors
    end
    
    def regions
      call :getTableRegions
    end

    def get(row, column)
      call :get, row, column
    end

    def get_row(row)
      call :getRow, row
    end
    
    def delete
      call :disableTable
      call :deleteTable
    end

    def delete_row(row)
      call :deleteAllRow, row
    end

    def delete_cells(row, column)
      call :deleteAll, row, column
    end

    def atomic_increment(row, column, value=1)
      call :atomicIncrement row, column, value
    end

    def create_scanner(row, *columns)
      sid = call :scannerOpen, row, columns
      Scanner.new @client, sid
    end

    # mutations is a key / value pair to insert / update for the given row
    # the keys are in the form "family:column"
    def mutate_row(row, mutations)
      mutations.map! { |k,v| Apache::Hadoop::Hbase::Thrift::Mutation.new(:column => k, :value => v) }
      call :mutateRow, row, mutations
    end

    private
    def call(method, *args)
      @client.send method, @name, *args
    end
  end

end
