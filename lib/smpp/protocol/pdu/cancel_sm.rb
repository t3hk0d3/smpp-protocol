module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class CancelSm < AbstractPDU
        register cancel_sm: 0x00000008
      end
    end
  end
end
