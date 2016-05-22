module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class BindTransceiverResp < ResponsePDU
        register bind_transceiver_resp: 0x80000009 do |pdu|
          pdu.cstring :system_id, max_size: 16
        end
      end
    end
  end
end
