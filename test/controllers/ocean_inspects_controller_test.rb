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
      post ocean_inspects_url, params: { ocean_inspect: { boat_id: @ocean_inspect.boat_id, captain: @ocean_inspect.captain, crew: @ocean_inspect.crew, date: @ocean_inspect.date, day: @ocean_inspect.day, diary: @ocean_inspect.diary, distance: @ocean_inspect.distance, e_time: @ocean_inspect.e_time, gas: @ocean_inspect.gas, leader: @ocean_inspect.leader, location: @ocean_inspect.location, month: @ocean_inspect.month, note: @ocean_inspect.note, oil: @ocean_inspect.oil, s_time: @ocean_inspect.s_time, wave: @ocean_inspect.wave, weather: @ocean_inspect.weather, work_items: @ocean_inspect.work_items, year: @ocean_inspect.year } }
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
    patch ocean_inspect_url(@ocean_inspect), params: { ocean_inspect: { boat_id: @ocean_inspect.boat_id, captain: @ocean_inspect.captain, crew: @ocean_inspect.crew, date: @ocean_inspect.date, day: @ocean_inspect.day, diary: @ocean_inspect.diary, distance: @ocean_inspect.distance, e_time: @ocean_inspect.e_time, gas: @ocean_inspect.gas, leader: @ocean_inspect.leader, location: @ocean_inspect.location, month: @ocean_inspect.month, note: @ocean_inspect.note, oil: @ocean_inspect.oil, s_time: @ocean_inspect.s_time, wave: @ocean_inspect.wave, weather: @ocean_inspect.weather, work_items: @ocean_inspect.work_items, year: @ocean_inspect.year } }
    assert_redirected_to ocean_inspect_url(@ocean_inspect)
  end

  test "should destroy ocean_inspect" do
    assert_difference('OceanInspect.count', -1) do
      delete ocean_inspect_url(@ocean_inspect)
    end

    assert_redirected_to ocean_inspects_url
  end
end
