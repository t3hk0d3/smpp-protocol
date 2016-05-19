module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class BroadcastSmResp < AbstractPDU
        register broadcast_sm_resp: 0x80000111
      end
    end
  end
end
