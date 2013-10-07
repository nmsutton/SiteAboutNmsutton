require 'test_helper'

class JobtagTest < ActiveSupport::TestCase
  test "project entry contains correct description" do
    assert_equal(jobtags(:sample_1).tagName, "Linux", "Description did not match the expected value")
  end
end
