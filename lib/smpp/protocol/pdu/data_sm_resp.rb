module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class DataSmResp < ResponsePDU
        register data_sm_resp: 0x80000103 do |pdu|
          pdu.cstring :message_id, max_size: 65
        end
      end
    end
  end
end
