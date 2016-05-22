module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class GenericNack < CommandPDU
        register generic_nack: 0x80000000
      end
    end
  end
end
