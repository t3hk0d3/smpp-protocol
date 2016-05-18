require 'thread'

module Smpp
  module Protocol
    class PDUStream
      ZERO_BYTE = "\x0".freeze

      def initialize(io)
        @io = io
        @mutex = Mutex.new
      end

      def read_byte
        read(1).unpack('C').first
      end

      def read_short
        read(2).unpack('n').first
      end

      def read_integer
        read(4).unpack('N').first
      end

      def read_cstring
        result = ''
        while((buf = read(1)) != ZERO_BYTE)
          result += buf
        end
        result
      end

      def read_string(size)
        read(size)
      end

      def write_byte(value)
        write([value].pack('C'))
      end

      def write_short(value)
        write([value].pack('n'))
      end

      def write_integer(value)
        write([value].pack('N'))
      end

      def write_cstring(value)
        write([value].pack('Z*'))
      end

      def write_string(value)
        write(value)
      end

      private

      def read(length)
        @mutex.synchronize do
          @io.read(length)
        end
      end

      def write(buffer)
        @mutex.synchronize do
          @io.write(buffer)
        end
      end
    end
  end
end