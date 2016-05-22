module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class SubmitSm < CommandPDU
        register submit_sm: 0x00000004 do |pdu|
          pdu.service_type :service_type

          pdu.type_of_number :source_addr_ton
          pdu.numbering_plan :source_addr_npi
          pdu.cstring        :source_addr, max_size: 21

          pdu.type_of_number :dest_addr_ton
          pdu.numbering_plan :dest_addr_npi
          pdu.cstring        :dest_addr, max_size: 21

          pdu.esm_class :esm_class

          pdu.byte      :protocol_id
          pdu.byte      :priority_flag

          pdu.datetime  :scheduled_delivery_time
          pdu.datetime  :validity_period

          pdu.registered_delivery :registered_delivery

          pdu.byte :replace_if_present

          pdu.data_coding :data_coding

          pdu.byte :sm_default_msg_id
          pdu.byte :sm_length

          pdu.string :short_message, :sm_length

          pdu.sme_address source_address:        :source_addr,
                          destination_address:   :dest_addr
        end
      end
    end
  end
end
