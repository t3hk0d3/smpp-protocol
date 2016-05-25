require 'date'

module Smpp
  module Protocol
    module Type
      # :nodoc:
      class DateTime < CString
        YEAR_DURATION   = 31_557_600
        MONTH_DURATION  = 2_592_000
        DAY_DURATION    = 86_400
        HOUR_DURATION   = 3600
        MINUTE_DURATION = 60

        DATETIME_REGEXP = /\A
          (?<year>\d{2})(?<month>\d{2})(?<day>\d{2})
          (?<hour>\d{2})(?<minute>\d{2})(?<second>\d{2})
          (?<ms>\d)(?<offset>\d{2})(?<mode>\+|\-|R)\Z
        /x

        register_type :datetime

        def value
          cached_datetime
        end

        def value=(val)
          case val
          when ::DateTime, Time
            @value = encode_date(val)
          when Numeric
            @value = encode_offset(val)
          else
            @value = val.to_s
          end
        end

        def default_options
          { max_size: 17 }
        end

        private

        def cached_datetime
          return unless @value
          return @cached_datetime if @cached_datetime && @cached_value == @value

          @cached_datetime = parse_date(@cached_value = @value)
        end

        def parse_date(date)
          return unless (match = DATETIME_REGEXP.match(date))

          date = normalize_date(match)

          if match[:mode] == 'R'
            decode_offset(date)
          else
            ::DateTime.new(
              normalize_year(date[:year]), date[:month], date[:day],
              date[:hour], date[:minute], date[:second] + (date[:ms] / 10.0),
              "#{match[:mode]}#{match[:offset].to_i}"
            )
          end
        end

        def normalize_date(match)
          Hash[
            [:year, :month, :day, :hour, :minute, :second, :ms, :offset].map do |k|
              [k, match[k].to_i]
            end
          ]
        end

        def normalize_year(year)
          year > 68 ? "19#{year}".to_i : "20#{year}".to_i
        end

        def encode_date(time)
          date = time.strftime('%y%m%d%H%M%S%1N')

          offset =
            if time.is_a?(Time)
              time.utc_offset / 3600
            else
              (time.offset * 24).floor
            end

          date + format('%02d%s', offset.abs, offset > 0 ? '+' : '-')
        end

        def decode_offset(date)
          date[:year] * YEAR_DURATION +
            date[:month] * MONTH_DURATION +
            date[:day] * DAY_DURATION +
            date[:hour] * HOUR_DURATION +
            date[:minute] * MINUTE_DURATION +
            date[:second] + (date[:ms] / 10.0)
        end

        def encode_offset(time)
          format(
            '%02d%02d%02d%02d%02d%02d%d00R',
            (time / YEAR_DURATION).to_i,
            (time % YEAR_DURATION / MONTH_DURATION).to_i,
            (time % YEAR_DURATION % MONTH_DURATION / DAY_DURATION).to_i,
            (time % YEAR_DURATION % MONTH_DURATION % DAY_DURATION / HOUR_DURATION).to_i,
            (time % YEAR_DURATION % MONTH_DURATION % DAY_DURATION % HOUR_DURATION / MINUTE_DURATION).to_i,
            (time % YEAR_DURATION % MONTH_DURATION % DAY_DURATION % HOUR_DURATION % MINUTE_DURATION).to_i,
            (time % YEAR_DURATION % MONTH_DURATION % DAY_DURATION % HOUR_DURATION % MINUTE_DURATION % 1 * 10).round(1)
          )
        end
      end
    end
  end
end
