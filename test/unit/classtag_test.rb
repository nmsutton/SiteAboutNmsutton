require 'test_helper'

class ClasstagTest < ActiveSupport::TestCase
  test "Tag does not contain wrong name" do
    refute_equal(classtags(:sample_1).tagName, "HTML", "Tag name did not match the expected value")
  end
end
