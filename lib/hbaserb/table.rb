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

    def delete_cells(row, column)
      call :deleteAll, row, column
    end

    def atomic_increment(row, column, value=1)
      call :atomicIncrement row, column, value
    end

    private
    def call(method, *args)
      @client.send method, @name, *args
    end
  end

end
