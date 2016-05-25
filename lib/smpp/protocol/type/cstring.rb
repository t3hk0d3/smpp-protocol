module Smpp
  module Protocol
    module Type
      # :nodoc:
      class CString < AbstractType
        register_type :cstring

        def initialize(pdu, name, options = {})
          super

          @value = options.fetch(:default, '')
        end

        def write(io)
          io.write_cstring(@value)
        end

        def read(io)
          @value = io.read_cstring
        end
      end
    end
  end
end
