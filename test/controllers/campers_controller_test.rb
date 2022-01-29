require "test_helper"

class CampersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get campers_index_url
    assert_response :success
  end

  test "should get new" do
    get campers_new_url
    assert_response :success
  end

  test "should get create" do
    get campers_create_url
    assert_response :success
  end
end
