module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class DeliverSmResp < ResponsePDU
        register deliver_sm_resp: 0x80000005
      end
    end
  end
end
