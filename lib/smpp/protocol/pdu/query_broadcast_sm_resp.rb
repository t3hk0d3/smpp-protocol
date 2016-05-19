module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class QueryBroadcastSmResp < AbstractPDU
        register query_broadcast_sm_resp: 0x80000112
      end
    end
  end
end
