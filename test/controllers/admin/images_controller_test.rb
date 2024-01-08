require "test_helper"

class Admin::ImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_images_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_images_destroy_url
    assert_response :success
  end
end
