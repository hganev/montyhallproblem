class GamesController < ApplicationController

  def start
  end

  def play
    doors = Game.create_doors
    session[:user_choice] = user_choice = game_params[:door_index].to_i
    session[:car] = car = doors.index(true)

    @open_door = session[:open_door] = Game.open_door(user_choice, car)

    respond_to do |format|
      format.js
    end
  end

  def reveal
    @game = Game.new 
    @game.switched = game_params[:switched] == "true"

    @car = session[:car]
    @open_door = session[:open_door]
    @second_goat = Game.open_door(@car, @open_door)
    @game.won = Game.resolve_game(session[:user_choice], @open_door, session[:car], @game.switched)

    @game.save

    @all_games_count = Game.get_all_games_count
    @switch_win_percentage = (Game.get_switching_success_rate(@all_games_count) * 100).round(3)
    @stay_win_percentage = (Game.get_staying_success_rate(@all_games_count) * 100).round(3)
    @result_text_class = @game.won ? "bg-success" : "bg-danger"

    @game_result_msg = print_game_result

    respond_to do |format|
      format.js
    end

    clean_session
  end

  def game_params
    params.permit(:door_index, :switched)
  end

  private 

  def clean_session
    session[:user_choice] = nil
    session[:open_door] = nil
  end

  def print_game_result
    @game.won ? "YOU WIN" : "YOU LOSE"
  end
end
