module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class QuerySm < AbstractPDU
        register query_sm: 0x00000003
      end
    end
  end
end
