require 'test_helper'

class ProjecttagTest < ActiveSupport::TestCase
  test "project entry contains correct description" do
    assert_equal(projecttags(:sample_1).tagName, "Linux", "Description did not match the expected value")
  end
end
