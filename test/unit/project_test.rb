require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "project entry contains correct time range" do
    assert_equal(projects(:sample_1).time_range, "12/10 - 04/11", "Time range did not match the expected value") 
  end
  
  test "project entry contains correct description" do
    assert_equal(projects(:sample_1).description, "Used Java and Perl to manipulate portions of genetic sequences for genetic transcription factor research.  XML was processed in Java using JDom for drug reaction research.  Data from multiple public databases were utilized and a variety of open source programs were integrated into the research.", "Description did not match the expected value")
  end
end
