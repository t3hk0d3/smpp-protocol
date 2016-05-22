require 'smpp/protocol/pdu_builder'

module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class AbstractPDU
        class << self
          attr_reader :command_id, :command_name

          def register(params, &block)
            @command_name, @command_id = params.first

            @builder = PDUBuilder.new(self, &block)

            PDU.register_pdu(@command_name, @command_id, self)
          end
        end
      end
    end
  end
end
