require 'spec_helper'

RSpec.describe ObjectComparator do
  subject { ObjectComparator.new }

  def failing_message_for_should(one, two)
    ObjectComparator.new.failing_message_for_should(one, two)
  end

  def create(last = { foo: :bar })
    DummyClass.new(foo: DummyClass.new(bar: last))
  end

  def deep
    DummyClass.new(DummyClass.new(DummyClass.new([1, 2, 3])))
  end

  describe '#is_equal_to?' do
    it 'returns true when objects are equal, but different object id' do
      one = create
      two = create

      one_deep = create(deep)
      two_deep = create(deep)

      expect(subject.equal?(one, two)).to be(true), failing_message_for_should(one, two)
      expect(subject.equal?(one_deep, two_deep)).to be(true), failing_message_for_should(one_deep, two_deep)
    end

    it 'returns false when objects have different property' do
      expect(subject.equal?(create('foo'), create(:foo))).to be(false)
      expect(subject.equal?(create('foo'), create)).to be(false)
    end
  end
end

RSpec.describe ObjectComparator::InspectionString do
  subject { described_class.new(inspection_string) }

  let(:inspection_string) do
    [
      '<SomeClass:0x007f8be52ad960 ',
      '@client=#<Clients::XingRest:0x007f8be6208f18 ',
      '@default_params={:rid=>:internal}, @client=RESTApi>'
    ].join('')
  end

  let(:clean_inspection_string) do
    [
      '<SomeClass ',
      '@client=#<Clients::XingRest ',
      '@default_params={:rid=>:internal}, @client=RESTApi>'
    ].join('')
  end

  describe '#eq' do
    it 'returns true when strings are the same, ignoring object id' do
      clean = described_class.new(clean_inspection_string)
      expect(subject).to eq(clean)
    end
  end

  describe '#to_s' do
    it 'removes the object ids' do
      expect(subject.to_s).to eq(clean_inspection_string)
    end

    it 'removes the object ids from deep objects' do
      input = '<DummyClass:0x00007fd324baf190 @arg={:foo=>#<DummyClass:0x00007fd324baf1e0 @arg={:bar=>{:foo=>:bar}}>}>'

      expected = '<DummyClass @arg={:foo=>#<DummyClass @arg={:bar=>{:foo=>:bar}}>}>'

      expect(described_class.new(input).to_s).to eq(expected)
    end


    it 'also remove ids from empty objects' do
      string = described_class.new('<SomeClass:0x007f8be52ad960>').to_s

      expected = '<SomeClass>'

      expect(string).to eq(expected)
    end
  end
end
