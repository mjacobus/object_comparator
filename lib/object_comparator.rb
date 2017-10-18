require "object_comparator/version"

class ObjectComparator
  def equal?(one, other)
    one = InspectionString.new(one.inspect)
    other = InspectionString.new(other.inspect)
    one == other
  end

  def failing_message_for(one, other)
    one = InspectionString.new(one.inspect)
    other = InspectionString.new(other.inspect)

    "expected that #{other} would be equal to #{one}"
  end

  class InspectionString
    def initialize(string)
      @string = string
    end

    def ==(other)
      other.to_s == to_s
    end

    def to_s
      @string.gsub(/:0x[a-z0-9]{14,16} /, ' ')
             .gsub(/:0x[a-z0-9]{14,16}>/, '>')
    end
  end
end
