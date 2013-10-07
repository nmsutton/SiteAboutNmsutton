require 'test_helper'

class JobTest < ActiveSupport::TestCase
  test "Number of table rows is correct" do
    assert_equal(Job.count, 1, "Wrong number of table rows were counted") 
  end
end
