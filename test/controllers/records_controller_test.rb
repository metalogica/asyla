require 'test_helper'

class RecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get records_index_url
    assert_response :success
  end

  test "should get show" do
    get records_show_url
    assert_response :success
  end

end
