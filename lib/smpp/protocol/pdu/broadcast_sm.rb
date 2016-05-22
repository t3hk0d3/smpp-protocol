module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class BroadcastSm < CommandPDU
        register broadcast_sm: 0x00000111 do |pdu|
          pdu.service_type :service_type

          pdu.type_of_number :source_addr_ton
          pdu.numbering_plan :source_addr_np
          pdu.cstring        :source_addr, max_size: 65

          pdu.cstring :message_id, max_size: 65

          pdu.byte    :priority_flag

          pdu.datetime :schedule_delivery_time
          pdu.datetime :validity_period

          pdu.byte :replace_if_present

          pdu.data_coding :data_coding

          pdu.byte :sm_default_msg_id

          pdu.sme_address source_address: :source_addr
        end
      end
    end
  end
end
