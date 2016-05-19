module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class EnquireLink < AbstractPDU
        register enquire_link: 0x00000015
      end
    end
  end
end
