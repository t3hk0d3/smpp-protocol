module Smpp
  module Protocol
    module Type
      # :nodoc:
      class String < AbstractType
        register_type :string

        def initialize(pdu, name, length_field_name, options = {})
          super(pdu, name, options)

          @length_field_name = length_field_name

          @value = options.fetch(:default, '')
        end

        def length
          length_field.value.to_i
        end

        def value=(value)
          @value = value
          length_field.value = value.bytesize
        end

        def write(io)
          io.write_string(@value)
        end

        def read(io)
          @value = io.read_string(@length)
        end

        private

        def length_field
          pdu.field(@length_field_name)
        end
      end
    end
  end
end
