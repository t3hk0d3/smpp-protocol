module Smpp
  module Protocol
    module Type
      # :nodoc:
      class ServiceType < CString
        register_type :service_type

        def initialize(pdu, name, options = {})
          super(pdu, name, { max_size: 9 }.merge!(options))
        end
      end
    end
  end
end
