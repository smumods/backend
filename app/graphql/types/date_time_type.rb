module Types
    class DateTimeType < Types::BaseScalar
        def self.coerce_input(value, _context)
            Time.zone.parse(value)
        end
        
        def self.coerce_result(value, _context)
            value.utc.to_i
        end
    end
end