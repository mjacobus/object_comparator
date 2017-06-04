require 'test_helper'

class ObjectComparatorTest < Minitest::Test
  include ObjectComparator::Minitest

  def test_can_assert
    a = DummyClass.new([1, 2])
    b = DummyClass.new([1, 2])

    assert_equal_objects(a, b)
  end

  def test_can_refute
    a = DummyClass.new([1, 2])
    b = DummyClass.new([2])

    refute_equal_objects(a, b)
  end
end

