require 'test_helper'

class ProjecttagTest < ActiveSupport::TestCase
  test "Check that a tag with a nil value is not present" do
    refute_nil(projecttags(:sample_1).tagName, "A tag was found to be nil in a project with tag entry")
  end
end
