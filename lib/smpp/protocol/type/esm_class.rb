module Smpp
  module Protocol
    module Type
      # :nodoc:
      class EsmClass < Byte
        register_type :esm_class

        def value
          Smpp::Protocol::EsmClass.parse(@value)
        end

        def value=(val)
          case val
          when Smpp::Protocol::EsmClass
            @value = val.to_byte
          when Fixnum
            @value = val
          else
            raise ArgumentError, 'Invalid value type'
          end
        end
      end
    end
  end
end
