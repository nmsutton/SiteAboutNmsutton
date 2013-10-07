require 'test_helper'

class ClasseTest < ActiveSupport::TestCase
  test "Number of class descriptions is correct" do
    assert_equal(Classe.count(:description), 2, "Number of class descriptions did not match the expected value") 
  end
end
