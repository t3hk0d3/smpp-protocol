module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class QueryBroadcastSm < AbstractPDU
        register query_broadcast_sm: 0x00000112
      end
    end
  end
end
