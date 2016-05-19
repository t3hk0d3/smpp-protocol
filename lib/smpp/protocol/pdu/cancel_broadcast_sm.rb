module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class CancelBroadcastSm < AbstractPDU
        register cancel_broadcast_sm: 0x00000113
      end
    end
  end
end
