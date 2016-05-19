module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class QuerySmResp < AbstractPDU
        register query_sm_resp: 0x80000003
      end
    end
  end
end
