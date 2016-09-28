require 'test_helper'

class OceanInspectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ocean_inspect = ocean_inspects(:one)
  end

  test "should get index" do
    get ocean_inspects_url
    assert_response :success
  end

  test "should get new" do
    get new_ocean_inspect_url
    assert_response :success
  end

  test "should create ocean_inspect" do
    assert_difference('OceanInspect.count') do
      post ocean_inspects_url, params: { ocean_inspect: {  } }
    end

    assert_redirected_to ocean_inspect_url(OceanInspect.last)
  end

  test "should show ocean_inspect" do
    get ocean_inspect_url(@ocean_inspect)
    assert_response :success
  end

  test "should get edit" do
    get edit_ocean_inspect_url(@ocean_inspect)
    assert_response :success
  end

  test "should update ocean_inspect" do
    patch ocean_inspect_url(@ocean_inspect), params: { ocean_inspect: {  } }
    assert_redirected_to ocean_inspect_url(@ocean_inspect)
  end

  test "should destroy ocean_inspect" do
    assert_difference('OceanInspect.count', -1) do
      delete ocean_inspect_url(@ocean_inspect)
    end

    assert_redirected_to ocean_inspects_url
  end
end
