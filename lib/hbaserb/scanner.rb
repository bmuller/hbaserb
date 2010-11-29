module HBaseRb
  
  class Scanner
    def initialize(client, scanner_id)
      @client = client
      @sid = scanner_id
      if block_given?
        n = next_row
        while n.length > 0
          yield n.first
          n = next_row
        end        
        close
      end
    end

    def next_row
      call :scannerGet
    end

    def close
      call :scannerClose
    end

    def each 
      n = next_row
      while n.length > 0
        yield n.first
        n = next_row
      end
    end

    private
    def call(method, *args)
      @client.send method, @sid, *args
    end
  end

end
