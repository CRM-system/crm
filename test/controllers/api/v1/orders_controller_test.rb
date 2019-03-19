require 'test_helper'

class Api::V1::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get api_v1_orders_new_url
    assert_response :success
  end

end
