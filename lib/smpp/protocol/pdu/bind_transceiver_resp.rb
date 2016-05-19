module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class BindTransceiverResp < AbstractPDU
        register bind_transceiver_resp: 0x80000009
      end
    end
  end
end
