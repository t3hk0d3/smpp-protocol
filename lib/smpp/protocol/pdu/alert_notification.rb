module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class AlertNotification < AbstractPDU
        register alert_notification: 0x00000102 do |pdu|
          pdu.type_of_number :source_addr_ton
          pdu.numbering_plan :source_addr_npi
          pdu.cstring        :source_addr, max_size: 65

          pdu.type_of_number :esme_addr_ton
          pdu.numbering_plan :esme_addr_npi
          pdu.cstring        :esme_addr, max_size: 65

          pdu.sme_address :source, :source_addr
          pdu.sme_address :esme,   :esme_addr
        end
      end
    end
  end
end
