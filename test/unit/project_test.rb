require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "project table contains data" do
    assert_equal(projects(:sample_project).time_range, "01/13 - 03/13") 
  end
end
