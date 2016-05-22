module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class EnquireLinkResp < ResponsePDU
        register enquire_link_resp: 0x80000015
      end
    end
  end
end
