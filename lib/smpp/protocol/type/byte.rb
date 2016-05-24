module Smpp
  module Protocol
    module Type
      # :nodoc:
      class Byte < AbstractType
        register_type :byte

        def initialize(pdu, name, options = {})
          super

          @value = options.fetch(:default, 0)
        end

        def write(io)
          io.write_byte(@value)
        end

        def read(io)
          @value = io.read_byte
        end
      end
    end
  end
end
