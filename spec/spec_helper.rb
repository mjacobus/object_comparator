require "bundler/setup"
require "object_comparator/rspec"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

class DummyClass
  def initialize(arg)
    @arg = arg
  end
end
