module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class DataSm < AbstractPDU
        register data_sm: 0x00000103
      end
    end
  end
end
