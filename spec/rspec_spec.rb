require 'spec_helper'

RSpec.describe 'rspec matcher' do
  it 'asserts positive match' do
    a1 = DummyClass.new([1, 2, 3])
    a2 = DummyClass.new([1, 2, 3])

    expect(a1).to be_equal_to(a2)
  end

  it 'asserts negative match' do
    a1 = DummyClass.new([1, 2, 3])
    a2 = DummyClass.new([1, 3])

    expect(a1).not_to be_equal_to(a2)
  end
end
