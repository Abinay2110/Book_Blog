require 'test_helper'

class FormpracControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get formprac_index_url
    assert_response :success
  end

  test "should get create" do
    get formprac_create_url
    assert_response :success
  end

end
