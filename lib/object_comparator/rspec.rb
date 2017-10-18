require 'object_comparator'

RSpec::Matchers.define :be_equal_to do |expected|
  match do |actual|
    ObjectComparator.new.equal?(actual, expected)
  end

  failure_message_for_should do |action|
    ObjectComparator.new.failing_message_for(expected, actual)
  end
end
