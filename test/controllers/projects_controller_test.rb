require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get intro" do
    get projects_intro_url
    assert_response :success
  end

  test "should get eval" do
    get projects_eval_url
    assert_response :success
  end

  test "should get result" do
    get projects_result_url
    assert_response :success
  end
end
