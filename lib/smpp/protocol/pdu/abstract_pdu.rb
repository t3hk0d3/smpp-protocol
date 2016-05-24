require 'smpp/protocol/pdu_builder'

module Smpp
  module Protocol
    module PDU
      # :nodoc:
      class AbstractPDU
        attr_reader :fields

        def initialize(params = {})
          @fields = self.class.builder.build(self)
          @fields_by_name = {}

          @fields.each do |field|
            @fields_by_name[field.name] = field

            field.set(params[field.name]) if params.key?(field.name)
          end
        end

        def field(name)
          @fields_by_name[name.to_sym]
        end

        def inspect
          "<#{self.class.name}>"
        end

        class << self
          attr_reader :command_id, :command_name, :builder

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
