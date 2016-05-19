module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class BindTransceiver < AbstractPDU
        register bind_transceiver: 0x00000009
      end
    end
  end
end
