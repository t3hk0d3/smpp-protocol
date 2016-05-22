module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class QuerySmResp < ResponsePDU
        register query_sm_resp: 0x80000003 do |pdu|
          pdu.cstring   :message_id, max_size: 65
          pdu.datetime  :final_date
          pdu.byte :message_state
          pdu.byte :error_code
        end
      end
    end
  end
end
