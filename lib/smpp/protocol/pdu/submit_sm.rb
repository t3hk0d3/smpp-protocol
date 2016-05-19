module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class SubmitSm < AbstractPDU
        register submit_sm: 0x00000004
      end
    end
  end
end
