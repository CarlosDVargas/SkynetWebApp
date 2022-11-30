require "test_helper"

class RoutesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @route = routes(:one)
  end

  test "should get index" do
    get routes_url
    assert_response :success
  end

  test "should get new" do
    get new_route_url
    assert_response :success
  end

  test "should create route" do
    assert_difference("Route.count") do
      post routes_url, params: { route: {  } }
    end

    assert_redirected_to route_url(Route.last)
  end

  test "should show route" do
    get route_url(@route)
    assert_response :success
  end

  test "should get edit" do
    get edit_route_url(@route)
    assert_response :success
  end

  test "should update route" do
    patch route_url(@route), params: { route: {  } }
    assert_redirected_to route_url(@route)
  end

  test "should destroy route" do
    assert_difference("Route.count", -1) do
      delete route_url(@route)
    end

    assert_redirected_to routes_url
  end
end
