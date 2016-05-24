module Smpp
  module Protocol
    # :nodoc:
    class PDUBuilder

      attr_reader :fields

      def initialize(klass)
        @klass  = klass
        @fields = []

        yield(self) if block_given?
      end

      def build(pdu)
        @fields.map do |(klass, name, args)|
          klass.new(pdu, name, *args)
        end
      end

      Smpp::Protocol::Type.types.each do |type, klass|
        define_method(type) do |name, *args|
          @fields << [klass, name, args]
        end
      end
    end
  end
end
