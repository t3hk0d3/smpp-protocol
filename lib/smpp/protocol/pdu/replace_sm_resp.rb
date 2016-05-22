module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class ReplaceSmResp < ResponsePDU
        register replace_sm_resp: 0x80000007
      end
    end
  end
end
