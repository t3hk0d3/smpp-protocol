module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class BindReceiverResp < AbstractPDU
        register bind_receiver_resp: 0x80000001
      end
    end
  end
end
