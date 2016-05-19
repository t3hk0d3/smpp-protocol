module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class DeliverSm < AbstractPDU
        register deliver_sm: 0x00000005
      end
    end
  end
end
