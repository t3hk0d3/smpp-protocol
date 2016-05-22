module Smpp
  module Protocol
    # :nodoc:
    module Type
      def self.types
        @types ||= {}
      end

      def self.register_type(name, klass)
        types[name] = klass
      end

      require_relative 'type/abstract_type'
      require_relative 'type/byte'
      require_relative 'type/cstring'
      require_relative 'type/string'
      require_relative 'type/composite'

      require_relative 'type/interface_version'
      require_relative 'type/type_of_number'
      require_relative 'type/numbering_plan'
      require_relative 'type/sme_address'
      require_relative 'type/service_type'
      require_relative 'type/esm_class'
      require_relative 'type/datetime'
      require_relative 'type/registered_delivery'
      require_relative 'type/data_coding'
      require_relative 'type/submit_multi_address'
    end
  end
end
