module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class BroadcastSm < AbstractPDU
        register broadcast_sm: 0x00000111
      end
    end
  end
end
