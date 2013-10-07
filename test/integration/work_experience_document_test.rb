require 'test_helper'
 
class WorkExperienceDocumentTest < ActionDispatch::IntegrationTest
  test "Work experience document forms submission is processed correctly" do
    post_via_redirect "/work_experience_extractor/process_work_experience_document", workExperienceRecords: "public/NateSuttonResume.xml"
    assert_not_nil(:projectDescriptions, "Project descriptions group was not found to contain data from the work experience document")
    assert_equal('/work_experience_extractor/process_work_experience_document', path, "Work experience document did not get processed correctly")
  end
end