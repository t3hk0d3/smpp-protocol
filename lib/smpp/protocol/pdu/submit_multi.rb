module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class SubmitMulti < AbstractPDU
        register submit_multi: 0x00000021
      end
    end
  end
end
