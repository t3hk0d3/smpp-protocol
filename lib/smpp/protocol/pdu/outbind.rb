module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class Outbind < AbstractPDU
        register outbind: 0x0000000B
      end
    end
  end
end
