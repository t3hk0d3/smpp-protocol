module Smpp
  module Protocol
    # :nodoc:
    class EsbClass
      MESSAGE_MODES = {
        default: 0,
        datagramm: 1,
        transaction: 2,
        store_and_forward: 3
      }.freeze

      MESSAGE_TYPES = {
        default: 0,
        delivery_receipt: 1,
        delivery_notification: 8
      }.freeze

      GSM_SPECIFIC = {
        none: 0,
        udh_indicatior: 1,
        reply_path: 2,
        udhi_and_reply_path: 3
      }.freeze

      def initialize(options = {})
        @messaging_mode = normalize options.fetch(:messaging_mode, :default), MESSAGE_MODES
        @message_type   = normalize options.fetch(:message_mode, :default), MESSAGE_TYPES
        @gsm_specific   = normalize options.fetch(:gsm_specific, :none), GSM_SPECIFIC
      end

      def messaging_mode
        MESSAGE_MODES.key(@messaging_mode)
      end

      def raw_messaging_mode
        @messaging_mode
      end

      def messaging_mode=(mode)
        @messaging_mode = normalize(mode, MESSAGE_MODES)
      end

      def message_type
        MESSAGE_TYPES.key(@message_type)
      end

      def raw_message_type
        @message_type
      end

      def message_type=(type)
        @message_type = normalize(type, MESSAGE_TYPES)
      end

      def gsm_specific
        GSM_SPECIFIC[@gsm_specific]
      end

      def raw_gsm_specific
        @gsm_specific
      end

      def gsm_specific=(gsm_specific)
        @gsm_specific = normalize(gsm_specific, GSM_SPECIFIC)
      end

      def to_byte
        ((@messaging_mode & 0b11)) | ((@message_type & 0b1111) << 2) | ((@gsm_specific & 0b11) << 6)
      end

      private

      def normalize(value, values)
        case value
        when String, Symbol
          values[value.to_sym] || raise(ArgumentError, 'Invalid value')
        when Fixnum
          value
        else
          raise ArgumentError, 'Invalid value'
        end
      end
    end
  end
end
