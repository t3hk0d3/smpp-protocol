module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class CancelSmResp < ResponsePDU
        register cancel_sm_resp: 0x80000008
      end
    end
  end
end
