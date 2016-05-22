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

        def get
          @value
        end

        alias raw_get get

        def set(value)
          @value = value
        end

        alias raw_set set

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
