module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class SubmitMultiResp < AbstractPDU
        register submit_multi_resp: 0x80000021
      end
    end
  end
end
