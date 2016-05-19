module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class BindTransmitterResp < AbstractPDU
        register bind_transmitter_resp: 0x80000002
      end
    end
  end
end
