require 'object_comparator'

RSpec::Matchers.define :be_equal_to do |expected|
  match do |actual|
    ObjectComparator.new.equal?(actual, expected)
  end

  failure_message do |actual|
    ObjectComparator.new.failing_message_for_should(expected, actual)
  end

  failure_message_when_negated do |actual|
    ObjectComparator.new.failing_message_for_should_not(expected, actual)
  end
end
