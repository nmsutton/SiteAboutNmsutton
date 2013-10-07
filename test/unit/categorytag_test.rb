require 'test_helper'

class CategorytagTest < ActiveSupport::TestCase
  test "Category equals the correct value" do
    assert_equal(categorytags(:sample_1).tag_category, "Operating Systems", "Description did not match the expected value")
  end
end
