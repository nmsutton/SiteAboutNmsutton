require 'test_helper'

class ClasstagTest < ActiveSupport::TestCase
  test "project entry contains correct description" do
    assert_equal(classtags(:sample_1).tagName, "Linux", "Description did not match the expected value")
  end
end
