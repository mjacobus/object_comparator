require 'object_comparator'

class ObjectComparator
  module Minitest
    def assert_equal_objects(obj1, obj2, message = nil)
      obj1 = InspectionString.new(obj1.inspect)
      obj2 = InspectionString.new(obj2.inspect)

      assert_equal(obj1, obj2, message)
    end

    def refute_equal_objects(obj1, obj2, message = nil)
      obj1 = InspectionString.new(obj1.inspect)
      obj2 = InspectionString.new(obj2.inspect)

      refute_equal(obj1, obj2, message)
    end
  end
end
