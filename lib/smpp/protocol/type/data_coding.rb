module Smpp
  module Protocol
    module Type
      # :nodoc:
      class DataCoding < Byte
        ENCODING_MAP = {
          'ASCII-8BIT'  => 1,
          'ISO-8859-1'  => 3,
          'ISO-8859-5'  => 6,
          'ISO-8859-8'  => 7,
          'UTF-16BE'    => 8,
          'USC-2'       => 8,
          'ISO-2022-JP' => 10
        }.freeze

        SYMBOL_MAP = {
          default:    0,
          ascii:      1,
          binary:     2,
          iso8859_1:  3,
          jis_x_0208: 4,
          iso8859_5:  6,
          iso8859_9:  7,
          ucs_2:      8,
          picogram:   9,
          iso2022_jp: 10,
          jis_x_0212: 13,
          ks_x_1001:  14
        }.freeze

        register_type :data_coding

        def value
          SYMBOL_MAP.fetch(@value, @value)
        end

        def value=(value)
          case value
          when Symbol
            @value = SYMBOL_MAP.fetch(value)
          when String
            @value = ENCODING_MAP.fetch(value, value.to_i)
          when Fixnum
            @value = value
          end
        end
      end
    end
  end
end
