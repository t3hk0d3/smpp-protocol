module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class QueryBroadcastSm < CommandPDU
        register query_broadcast_sm: 0x00000112 do |pdu|
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
