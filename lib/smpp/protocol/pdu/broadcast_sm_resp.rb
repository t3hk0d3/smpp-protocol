module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class BroadcastSmResp < ResponsePDU
        register broadcast_sm_resp: 0x80000111 do |pdu|
          pdu.cstring :message_id, max_size: 65
        end
      end
    end
  end
end
