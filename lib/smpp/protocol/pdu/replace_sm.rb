module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class ReplaceSm < CommandPDU
        register replace_sm: 0x00000007 do |pdu|
          pdu.cstring :message_id, max_size: 65

          pdu.type_of_number :source_addr_ton
          pdu.numbering_plan :source_addr_npi
          pdu.cstring        :source_addr, max_size: 21

          pdu.datetime  :scheduled_delivery_time
          pdu.datetime  :validity_period

          pdu.registered_delivery :registered_delivery

          pdu.byte :sm_default_msg_id
          pdu.byte :sm_length

          pdu.string :short_message, :sm_length

          pdu.sme_address source_address: :source_addr
        end
      end
    end
  end
end
