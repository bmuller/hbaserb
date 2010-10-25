module HBaseRb
  
  class Scanner
    def initialize(client, scanner_id)
      @client = client
      @sid = scanner_id
    end

    def nextRow
      call :scannerGet
    end

    def close
      call :scannerClose
    end

    private
    def call(method, *args)
      @client.send method, @sid, *args
    end
  end

end
