require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "project table contains data" do
    #assert_equal(Projects.count, 1)
    assert_equal(projects(:one).time_range, "10") 
  end
  
  test "the truth" do
        assert true
  end
end
