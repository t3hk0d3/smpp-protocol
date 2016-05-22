module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class CancelBroadcastSm < CommandPDU
        register cancel_broadcast_sm: 0x00000113 do |pdu|
          pdu.cstring :service_type, max_size: 9

          pdu.cstring :message_id, max_size: 65

          pdu.type_of_number :source_addr_ton
          pdu.numbering_plan :source_addr_npi
          pdu.cstring        :source_addr, max_size: 21

          pdu.sme_address source_address: :source_addr
        end
      end
    end
  end
end
