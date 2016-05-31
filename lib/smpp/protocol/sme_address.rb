module Smpp
  module Protocol
    # :nodoc:
    class SmeAddress
      TYPE_OF_NUMBER = {
        unknown: 0,
        international: 1,
        national: 2,
        network_specific: 3,
        subscriber_number: 4,
        alphanumeric: 5,
        abbreviated: 6
      }.freeze

      def initialize(params = {})

      end

      def type_of_number
        TYPE_OF_NUMBER[@ton]
      end

      def ton
        @ton
      end

      def numeric_plan_indicator

      end

      def npi
        @npi
      end

      def address

      end



    end
  end
end
