require 'thread'

module Smpp
  module Protocol
    # :nodoc:
    class PDUParser
      HEADER_LENGTH = 16

      def initialize(io)
        @stream = PDUStream.new(io)
        @mutex = Mutex.new
      end

      def parse
        @mutex.synchronize do
          header = PDUHeader.read(io)

          pdu_klass = Smpp::Protocol::PDU.class_for(header.command_id)

          raise "Unknown command_id = '#{command_id}'" unless pdu_klass

          pdu_klass.parse(
            id:     command_id, length: command_length,
            status: command_status, number: command_number,
            stream: pdu_stream
          )
        end
      end
    end
  end
end
