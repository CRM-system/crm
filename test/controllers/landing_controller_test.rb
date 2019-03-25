require 'test_helper'

class LandingControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get landing_new_url
    assert_response :success
  end

  test "should get index" do
    get landing_index_url
    assert_response :success
  end

  test "should get show" do
    get landing_show_url
    assert_response :success
  end

  test "should get create" do
    get landing_create_url
    assert_response :success
  end

  test "should get edit" do
    get landing_edit_url
    assert_response :success
  end

  test "should get update" do
    get landing_update_url
    assert_response :success
  end

  test "should get destroy" do
    get landing_destroy_url
    assert_response :success
  end

end
