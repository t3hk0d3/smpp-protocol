module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class QueryBroadcastSmResp < ResponsePDU
        register query_broadcast_sm_resp: 0x80000112 do |pdu|
          pdu.cstring :message_id, max_size: 65
        end
      end
    end
  end
end
