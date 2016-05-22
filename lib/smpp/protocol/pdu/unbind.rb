module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class Unbind < CommandPDU
        register unbind: 0x00000006
      end
    end
  end
end
