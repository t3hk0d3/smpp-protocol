module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class AbstractPDU
        def self.register(params)
          @command_name, @command_id = params.first

          PDU.register_pdu(@command_name, @command_id, self)
        end

        def self.command_id
          @command_id
        end

        def self.command_name
          @command_name
        end
      end
    end
  end
end
