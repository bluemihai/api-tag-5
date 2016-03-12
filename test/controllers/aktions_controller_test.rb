require 'test_helper'

class AktionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aktion = aktions(:one)
  end

  test "should get index" do
    get aktions_url
    assert_response :success
  end

  test "should create aktion" do
    assert_difference('Aktion.count') do
      post aktions_url, params: { aktion: { focus: @aktion.focus, player_id: @aktion.player_id, timeslot: @aktion.timeslot } }
    end

    assert_response 201
  end

  test "should show aktion" do
    get aktion_url(@aktion)
    assert_response :success
  end

  test "should update aktion" do
    patch aktion_url(@aktion), params: { aktion: { focus: @aktion.focus, player_id: @aktion.player_id, timeslot: @aktion.timeslot } }
    assert_response 200
  end

  test "should destroy aktion" do
    assert_difference('Aktion.count', -1) do
      delete aktion_url(@aktion)
    end

    assert_response 204
  end
end
