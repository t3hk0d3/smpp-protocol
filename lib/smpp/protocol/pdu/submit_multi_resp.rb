module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class SubmitMultiResp < ResponsePDU
        register submit_multi_resp: 0x80000021 do |pdu|
          pdu.cstring :message_id, max_size: 65

          pdu.byte :no_unsuccess

          pdu.composite :unsuccess_sme, :no_unsuccess do |field|
            field.type_of_number :dest_addr_ton
            field.numbering_plan :dest_addr_npi
            field.cstring        :dest_addr, max_size: 21
            field.byte           :error_status_code

            field.sme_address destination: :dest_addr
          end
        end
      end
    end
  end
end
