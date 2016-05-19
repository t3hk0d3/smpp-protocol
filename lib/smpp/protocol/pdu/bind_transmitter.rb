module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class BindTransmitter < AbstractPDU
        register bind_transmitter: 0x00000002
      end
    end
  end
end
