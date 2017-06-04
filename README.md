# ObjectComparator

Helps compare objects internals with rspec without having to implement `equal?` or `==`.

[![Build Status](https://travis-ci.org/mjacobus/object_comparator.svg?branch=master)](https://travis-ci.org/mjacobus/object_comparator)
[![Code Climate](https://codeclimate.com/github/mjacobus/object_comparator/badges/gpa.svg)](https://codeclimate.com/github/mjacobus/object_comparator)
[![Issue Count](https://codeclimate.com/github/mjacobus/object_comparator/badges/issue_count.svg)](https://codeclimate.com/github/mjacobus/object_comparator)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'object_comparator'
```

## Usage

### RSpec

```ruby
# spec/spec_helper.rb

require "object_comparator/rspec"

# your spec file

require 'spec_helper'

RSpec.describe MyUserService do
  it 'creates user' do
    a = User.new(id: 1, name: 'John Doe')
    b = a.dup

    expect(a).not_to be(b)

    # this is what you get, no reason need to implement equal?
    expect(a).to be_equal_to(b)
  end
end
```

### Minitest

```ruby
require 'object_comparator/minitest'

class ObjectComparatorTest < Minitest::Test
  include ObjectComparator::Minitest

  def test_can_assert
    a = User.new(id: 1, name: 'John Doe')
    b = b.dup

    assert_equal_objects(a, b)
  end

  def test_can_refute
    a = User.new(id: 1, name: 'John Doe')
    b = User.new(id: 1, name: 'Other name')

    refute_equal_objects(a, b)
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mjacobus/object_comparator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

