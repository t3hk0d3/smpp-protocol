module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class DataSm < CommandPDU
        register data_sm: 0x00000103 do |pdu|
          pdu.service_type :service_type

          pdu.type_of_number :source_addr_ton
          pdu.numbering_plan :source_addr_npi
          pdu.cstring        :source_addr, max_size: 65

          pdu.type_of_number :dest_addr_ton
          pdu.numbering_plan :dest_addr_npi
          pdu.cstring        :dest_addr, max_size: 65

          pdu.esm_class :esm_class

          pdu.registered_delivery :registered_delivery

          pdu.data_coding :data_coding

          pdu.sme_address    :source_address,       :source_addr
          pdu.sme_address    :destination_address,  :dest_addr
        end
      end
    end
  end
end
