require 'test_helper'

class UsefulsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @useful = usefuls(:one)
  end

  test "should get index" do
    get usefuls_url
    assert_response :success
  end

  test "should get new" do
    get new_useful_url
    assert_response :success
  end

  test "should create useful" do
    assert_difference('Useful.count') do
      post usefuls_url, params: { useful: { catalog: @useful.catalog, name: @useful.name } }
    end

    assert_redirected_to useful_url(Useful.last)
  end

  test "should show useful" do
    get useful_url(@useful)
    assert_response :success
  end

  test "should get edit" do
    get edit_useful_url(@useful)
    assert_response :success
  end

  test "should update useful" do
    patch useful_url(@useful), params: { useful: { catalog: @useful.catalog, name: @useful.name } }
    assert_redirected_to useful_url(@useful)
  end

  test "should destroy useful" do
    assert_difference('Useful.count', -1) do
      delete useful_url(@useful)
    end

    assert_redirected_to usefuls_url
  end
end
