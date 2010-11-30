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
      call :get, row.to_s, column
    end

    # get the last value for the given row / column
    def get_last(row, column, default=nil)
      r = get(row, column)
      (r.length > 0) ? r.first.value : default
    end

    def get_row(row)
      call :getRow, row.to_s
    end
    
    def delete
      call :disableTable
      call :deleteTable
    end

    def delete_row(row)
      call :deleteAllRow, row.to_s
    end

    def delete_cells(row, column)
      call :deleteAll, row.to_s, column
    end

    def atomic_increment(row, column, value=1)
      call :atomicIncrement, row.to_s, column, value
    end

    # pass in no params to scan whole table
    def create_scanner(row=nil, *columns, &block)
      row ||= ""
      columns = (columns.length > 0) ? columns : column_families.keys 
      sid = call :scannerOpen, row.to_s, columns
      Scanner.new @client, sid, &block
    end

    # mutations is a key / value pair to insert / update for the given row
    # the keys are in the form "family:column"
    def mutate_row(row, mutations)
      mutations = mutations.map { |k,v| Apache::Hadoop::Hbase::Thrift::Mutation.new(:column => k, :value => v) }
      call :mutateRow, row, mutations
    end

    def to_s
      s = ""
      create_scanner { |r|
        cols = r.columns.map { |k,v| "#{k}: #{v.value}" }.join(", ")
        s += "#{r.row}: #{cols}\n"
      }
      s
    end

    private
    def call(method, *args)
      @client.send method, @name, *args
    end
  end

end
