module Smpp
  module Protocol
    module Type
      # :nodoc:
      class AbstractType
        attr_reader :pdu, :name, :options

        attr_accessor :value

        def initialize(pdu, name, options = {})
          @pdu = pdu
          @name = name
          @options = options

          @value = nil
        end

        def raw_value
          value
        end

        def raw_value=(value)
          self.value = value
        end

        def write(_io)
          raise 'NotImplemented!'
        end

        def read(_io)
          raise 'NotImplemented!'
        end

        def self.register_type(name)
          Type.register_type(name, self)
        end

        def inspect
          "<#{self.class.name} #{name}>"
        end
      end
    end
  end
end
