module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class CancelBroadcastSmResp < AbstractPDU
        register cancel_broadcast_sm_resp: 0x80000113
      end
    end
  end
end
