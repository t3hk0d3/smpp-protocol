module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class BindTransmitterResp < ResponsePDU
        register bind_transmitter_resp: 0x80000002 do |pdu|
          pdu.cstring :system_id, max_size: 16
        end
      end
    end
  end
end
