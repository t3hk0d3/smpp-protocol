module Smpp
  module Protocol
    module Type
      # :nodoc:
      class String < AbstractType
        DEFAULT_PADDING_CHAR = "\x0".freeze

        register_type :string

        attr_reader :padding_char

        def initialize(pdu, name, length, options = {})
          super

          @length = normalize_length(length)
          @value = options.fetch(:default, '')
          @padding_char = options.fetch(:padding_char, DEFAULT_PADDING_CHAR)
        end

        def length
          if @length.is_a?(AbstractType)
            @length.get.to_i
          else
            @length
          end
        end

        def get
          @value
        end

        def set(value)
          @value = value
          update_length!(value.byte_size)
        end

        def write(io)
          # padding is required for fixed-size strings
          padding_size = length - @value.byte_size

          io.write_string(@value + padding)
          io.write_string(padding_char * padding_size) if padding_size > 0
        end

        def read(io)
          @value = io.read_string(@length)
        end

        private

        def update_length!(value)
          if @length.is_a?(AbstractType)
            # TODO: Check min/max value
            @length.set(value)
          elsif value > @length
            raise "Specified string is longer than specified field length = #{@length}"
          end
        end

        def normalize_length(length)
          if length.is_a?(Fixnum) # fixed size string
            length.to_i
          elsif length.is_a?(Symbol) # field reference
            pdu.field(length)
          else
            raise 'Invalid length!'
          end
        end
      end
    end
  end
end
