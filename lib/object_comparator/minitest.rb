require 'object_comparator'

class ObjectComparator
  module Minitest
    def assert_equal_objects(expected, actual, message = nil)
      expected = InspectionString.new(expected.inspect)
      actual = InspectionString.new(actual.inspect)

      message ||= ObjectComparator.new.failing_message_for_should(expected, actual)

      assert_equal(expected, actual, message)
    end

    def refute_equal_objects(expected, actual, message = nil)
      expected = InspectionString.new(expected.inspect)
      actual = InspectionString.new(actual.inspect)

      message ||= ObjectComparator.new.failing_message_for_should_not(expected, actual)

      refute_equal(expected, actual, message)
    end
  end
end
