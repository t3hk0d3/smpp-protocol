module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class UnbindResp < ResponsePDU
        register unbind_resp: 0x80000006
      end
    end
  end
end
