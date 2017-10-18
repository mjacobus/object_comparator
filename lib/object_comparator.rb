require "object_comparator/version"

class ObjectComparator
  def equal?(one, other)
    one = InspectionString.new(one.inspect)
    other = InspectionString.new(other.inspect)
    one == other
  end

  def failing_message_for_should(one, other)
    one = InspectionString.new(one.inspect)
    other = InspectionString.new(other.inspect)

    "expected #{other} to be equal to #{one}"
  end

  def failing_message_for_should_not(one, other)
    one = InspectionString.new(one.inspect)
    other = InspectionString.new(other.inspect)

    "expected #{other} not to be equal to #{one}"
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
