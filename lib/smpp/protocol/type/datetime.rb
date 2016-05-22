module Smpp
  module Protocol
    module Type
      # :nodoc:
      class DateTime < CString
        register_type :datetime

        def initialize(pdu, name, options = {})
          super(pdu, name, { max_size: 17 }.merge!(options))
        end
      end
    end
  end
end
