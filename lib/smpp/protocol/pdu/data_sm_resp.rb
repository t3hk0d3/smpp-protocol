module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class DataSmResp < AbstractPDU
        register data_sm_resp: 0x80000103
      end
    end
  end
end
