require 'test_helper'

class PlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player = players(:one)
  end

  test "should get index" do
    get players_url
    assert_response :success
  end

  test "should create player" do
    assert_difference('Player.count') do
      post players_url, params: { player: { email: @player.email, fictional: @player.fictional, name: @player.name, role: @player.role } }
    end

    assert_response 201
  end

  test "should show player" do
    get player_url(@player)
    assert_response :success
  end

  test "should update player" do
    patch player_url(@player), params: { player: { email: @player.email, fictional: @player.fictional, name: @player.name, role: @player.role } }
    assert_response 200
  end

  test "should destroy player" do
    assert_difference('Player.count', -1) do
      delete player_url(@player)
    end

    assert_response 204
  end
end
