require 'test_helper'

class BviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bviews_index_url
    assert_response :success
  end

  test "should get new" do
    get bviews_new_url
    assert_response :success
  end

  test "should get edit" do
    get bviews_edit_url
    assert_response :success
  end

end
