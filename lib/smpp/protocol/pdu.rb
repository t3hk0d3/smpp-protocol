module Smpp
  module Protocol
    # :nodoc:
    module PDU
      def self.pdu_registry
        @pdu_registry ||= {}
      end

      def self.pdu_commands
        @pdu_commands ||= {}
      end

      def self.register_pdu(name, command_id, klass)
        pdu_registry[name.to_sym] = klass
        pdu_commands[command_id] = name.to_sym
      end

      def self.class_for(command_id)
        command_name = pdu_commands[command_id]

        return unless command_name

        pdu_registry[command_name]
      end

      require_relative 'pdu/abstract_pdu'
      require_relative 'pdu/bind_receiver'
      require_relative 'pdu/bind_transmitter'
      require_relative 'pdu/query_sm'
      require_relative 'pdu/submit_sm'
      require_relative 'pdu/deliver_sm'
      require_relative 'pdu/unbind'
      require_relative 'pdu/replace_sm'
      require_relative 'pdu/cancel_sm'
      require_relative 'pdu/bind_transceiver'
      require_relative 'pdu/outbind'
      require_relative 'pdu/enquire_link'
      require_relative 'pdu/submit_multi'
      require_relative 'pdu/alert_notification'
      require_relative 'pdu/data_sm'
      require_relative 'pdu/broadcast_sm'
      require_relative 'pdu/query_broadcast_sm'
      require_relative 'pdu/cancel_broadcast_sm'
      require_relative 'pdu/generic_nack'
      require_relative 'pdu/bind_receiver_resp'
      require_relative 'pdu/bind_transmitter_resp'
      require_relative 'pdu/query_sm_resp'
      require_relative 'pdu/submit_sm_resp'
      require_relative 'pdu/deliver_sm_resp'
      require_relative 'pdu/unbind_resp'
      require_relative 'pdu/replace_sm_resp'
      require_relative 'pdu/cancel_sm_resp'
      require_relative 'pdu/bind_transceiver_resp'
      require_relative 'pdu/enquire_link_resp'
      require_relative 'pdu/submit_multi_resp'
      require_relative 'pdu/data_sm_resp'
      require_relative 'pdu/broadcast_sm_resp'
      require_relative 'pdu/query_broadcast_sm_resp'
      require_relative 'pdu/cancel_broadcast_sm_resp'
    end
  end
end
