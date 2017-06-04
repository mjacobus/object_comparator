require 'spec_helper'

RSpec.describe ObjectComparator do
  subject { ObjectComparator.new }

  def create(last = { foo: :bar })
    DummyClass.new(foo: DummyClass.new(bar: last))
  end

  def deep
    DummyClass.new(DummyClass.new(DummyClass.new([1, 2, 3])))
  end

  describe '#is_equal_to?' do
    it 'returns true when objects are equal, but different object id' do
      expect(subject.equal?(create, create)).to be(true)
      expect(subject.equal?(create(deep), create(deep))).to be(true)
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

    it 'also remove ids from empty objects' do
      string = described_class.new('<SomeClass:0x007f8be52ad960>').to_s

      expected = '<SomeClass>'

      expect(string).to eq(expected)
    end
  end
end
