module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class GenericNack < AbstractPDU
        register generic_nack: 0x80000000
      end
    end
  end
end
