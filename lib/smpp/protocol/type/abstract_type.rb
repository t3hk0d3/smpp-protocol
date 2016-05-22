module Smpp
  module Protocol
    module Type
      # :nodoc:
      class AbstractType
        attr_reader :pdu, :name, :options

        def initialize(pdu, name, options = {})
          @pdu = pdu
          @name = name
          @options = options
        end

        def get
          raise 'NotImplemented!'
        end

        def raw_get
          raise 'NotImplemented!'
        end

        def set(_value)
          raise 'NotImplemented!'
        end

        def raw_set(_value)
          raise 'NotImplemented!'
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
      end
    end
  end
end
