module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class SubmitSmResp < ResponsePDU
        register submit_sm_resp: 0x80000004 do |pdu|
          pdu.cstring :message_id, max_size: 65
        end
      end
    end
  end
end
