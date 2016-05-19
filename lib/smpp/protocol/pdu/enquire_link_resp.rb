module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class EnquireLinkResp < AbstractPDU
        register enquire_link_resp: 0x80000015
      end
    end
  end
end
