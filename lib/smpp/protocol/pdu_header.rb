module Smpp
  module Protocol
    # :nodoc:
    class PDUHeader
      def initialize(length:, command_id:, status:, sequence:)
        @command_id   = command_id
        @length       = length
        @status       = status
        @sequence     = sequence
      end

      def self.read(io)
        length      = io.read_integer
        command_id  = io.read_integer
        status      = io.read_integer
        number      = io.read_integer

        new(
          length: length, command: command_id,
          status: status, sequence: number
        )
      end
    end
  end
end
