module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class Outbind < AbstractPDU
        register outbind: 0x0000000B do |pdu|
          pdu.cstring :system_id, max_size: 16
          pdu.cstring :password,  max_size: 9
        end
      end
    end
  end
end
