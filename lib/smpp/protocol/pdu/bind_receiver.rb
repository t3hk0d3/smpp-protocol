module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class BindReceiver < AbstractPDU
        register bind_receiver: 0x00000001
      end
    end
  end
end
