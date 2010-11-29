module Apache
  module Hadoop
    module Hbase
      module Thrift


        class TCell
          def to_i16
            val, = value.unpack('n')
            (val > 0x7fff) ? (0 - ((val - 1) ^ 0xffff)) : val
          end

          def to_i32
            val, = value.unpack('N')
            (val > 0x7fffffff) ? (0 - ((val - 1) ^ 0xffffffff)) : val
          end
          
          def to_i64
            hi, lo = value.unpack('N2')
            if (hi > 0x7fffffff)
              hi ^= 0xffffffff
              lo ^= 0xffffffff
              0 - (hi << 32) - lo - 1
            else
              (hi << 32) + lo
            end
          end
          
          def to_double
            value.unpack('G').first
          end
        end


      end
    end
  end
end
