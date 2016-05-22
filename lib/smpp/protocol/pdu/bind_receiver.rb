module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class BindReceiver < CommandPDU
        register bind_receiver: 0x00000001 do |pdu|
          pdu.cstring           :system_id,     max_size: 16
          pdu.cstring           :password,      max_size: 9
          pdu.cstring           :system_type,   max_size: 13
          pdu.interface_version :interface_version
          pdu.type_of_number    :addr_ton
          pdu.numbering_plan    :addr_npi
          pdu.cstring           :address_range, max_size: 41
        end
      end
    end
  end
end
