module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class DeliverSm < CommandPDU
        register deliver_sm: 0x00000005
      end
    end
  end
end
