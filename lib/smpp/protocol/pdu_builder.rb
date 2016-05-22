module Smpp
  module Protocol
    # :nodoc:
    class PDUBuilder
      def initialize(klass)
        @klass  = klass
        @fields = []

        yield(self) if block_given?
      end

      Smpp::Protocol::Type.types.each do |type, klass|
        define_method(type) do |name, *args|
          @fields << [klass, name, args]
        end
      end
    end
  end
end
