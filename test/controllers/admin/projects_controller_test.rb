require "test_helper"

class Admin::ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_projects_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_projects_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_projects_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_projects_destroy_url
    assert_response :success
  end
end
