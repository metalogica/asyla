require 'test_helper'

class GoalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get goals_index_url
    assert_response :success
  end

  test "should get show" do
    get goals_show_url
    assert_response :success
  end

end
