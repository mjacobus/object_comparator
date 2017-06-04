require 'object_comparator'

RSpec::Matchers.define :be_equal_to do |expected|
  match do |actual|
    ObjectComparator.new.equal?(actual, expected)
  end
end
