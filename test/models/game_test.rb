require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test "check doors" do
    doors = Game.create_doors
    assert doors.length == 3 , "Expected number of doors is 3 but it was #{doors.length}"
  end

  test "choosing of goat" do
    doors = [false, false, true]

    goat_index = Game.open_door(doors, 0)
    assert goat_index == 1 , "Expected goat_index is 1 but it was #{goat_index}"
  end

  test "losing the game without switch" do
    doors = [false, false, true]
    user_choice_index = 0
    open_door_index = 1
    car_index = 2
    switched = false

    won = Game.resolve_game(user_choice_index, open_door_index, switched, car_index)

    assert won == false , "Expected result of the game is false(lose) but it was #{won}"
  end

  test "winning the game with switch" do
    doors = [false, false, true]
    user_choice_index = 0
    open_door_index = 1
    car_index = 2
    switched = true

    won = Game.resolve_game(user_choice_index, open_door_index, car_index, switched)

    assert won == true , "Expected result of the game is true(win) but it was #{won}"
  end
end
