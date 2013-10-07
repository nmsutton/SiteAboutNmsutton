require 'test_helper'

class WorkExperienceExtractorControllerTest < ActionController::TestCase
  test "should get ExtractExperienceSections" do
    get :ExtractExperienceSections
    assert_response :success
  end
end
