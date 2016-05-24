module Smpp
  module Protocol
    module Type
      # :nodoc:
      class SmeAddress < AbstractType
        register_type :sme_address

        def initialize(pdu, name, field_prefix, options = {})
          super(pdu, name, options)

          @field_prefix = field_prefix

          @type_of_number = options.fetch(:type_of_number, "#{field_prefix}_ton")
          @numbering_plan = options.fetch(:numbering_plan, "#{field_prefix}_npi")
          @address        = options.fetch(:address, "#{field_prefix}_addr")
        end

        def value
          Smpp::Protocol::SMEAddress.new(
            ton: type_of_number_field.value,
            npi: numbering_plan_field.value,
            address: address_field.value
          )
        end

        def value=(value)
          unless value.is_a?(Smpp::Protocol::SMEAddress)
            raise ArgumentError, 'value should be Smpp::Protocol::SMEAddress'
          end

          type_of_number_field.set(value.ton)
          numbering_plan_field.set(value.npi)
          address_field.set(value.address)
        end

        def write(_io)
          # do nothing, this is meta field
        end

        def read(_io)
          # do nothing, this is meta field
        end

        private

        def type_of_number_field
          @pdu.field(@type_of_number)
        end

        def numbering_plan_field
          @pdu.field(@numbering_plan)
        end

        def address_field
          @pdu.field(@type_of_number)
        end
      end
    end
  end
end
