require 'test_helper'

class JobtagTest < ActiveSupport::TestCase
  test "Assure count of tags with jobs is a minimum value" do
    assert_operator(Jobtag.count, :>=, 4, "Number of tags with jobs was incorrect because of being too low")
  end
end
