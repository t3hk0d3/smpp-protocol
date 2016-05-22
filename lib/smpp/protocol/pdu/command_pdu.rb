module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class CommandPDU < AbstractPDU
        def create_reponse(params = {})
          response_class.new(params)
        end

        def response_class
          Smpp::Protocol::PDU
        end
      end
    end
  end
end
