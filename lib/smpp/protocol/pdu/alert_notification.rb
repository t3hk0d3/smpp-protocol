module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class AlertNotification < AbstractPDU
        register alert_notification: 0x00000102
      end
    end
  end
end
