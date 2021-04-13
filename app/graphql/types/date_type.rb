module Types
  class DateType < Types::BaseScalar
    description 'Date'

    def self.coerce_input(value, _context)
      Time.zone.parse(value)
    end

    def self.coerce_result(value, _context)
      value.try(:to_time).try(:utc).try(:strftime, '%m-%d-%Y')
    end
  end
end
