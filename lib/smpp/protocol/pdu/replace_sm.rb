module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class ReplaceSm < AbstractPDU
        register replace_sm: 0x00000007
      end
    end
  end
end
