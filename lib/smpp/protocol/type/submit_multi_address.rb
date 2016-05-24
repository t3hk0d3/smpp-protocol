module Smpp
  module Protocol
    module Type
      # :nodoc:
      class SubmitMultiAddress < AbstractType
        register_type :submit_multi_address

        def initialize(pdu, name, length, options = {})
          super

          @length = pdu.field(:length)
          @value  = options.fetch(:default, [])
        end

        def value

        end

        def value=(value)

        end

        def write(io)

        end

        def read(io)
          length.get.to_i.times do
            case io.read_byte # read dest_flag
            when 0x01 # SME Address
              @value << read_sme(io)
            when 0x02 # Distribution list
              @value << read_dl(io)
            else
              raise "Unknown dest_flag = #{type}"
            end
          end
        end

        private

        def read_dl(io)
          io.read_cstring(max: 21)
        end

        def read_sme(io)
          ton  = io.read_byte
          npi  = io.read_byte
          addr = io.read_cstring(max: 21)

          Smpp::Protocol::SMEAddress.new(ton: ton, npi: npi, address: addr)
        end
      end
    end
  end
end
