module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class SubmitSmResp < AbstractPDU
        register submit_sm_resp: 0x80000004
      end
    end
  end
end
