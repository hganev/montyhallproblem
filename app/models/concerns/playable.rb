module Playable
  extend ActiveSupport::Concern

  module ClassMethods

    def create_doors
      doors = [false, false, false]
      doors[rand(3)] = true   
      doors
    end

    def open_door(index1, index2) 
      ([0,1,2] - [index1, index2]).first
    end

    def resolve_game(user_choice, open_door, car, switched)
      final_choice = switched ? self.open_door(user_choice, open_door) : user_choice
      (final_choice == car) ? true : false
    end

    def get_switching_success_rate
      Game.by_switched_and_won.size.to_f / Game.by_switched.size.to_f
    end

    def get_staying_success_rate
      stayed_games = Game.by_stayed.size.to_f
      (stayed_games > 0) ? (Game.by_stayed_and_won.size.to_f / stayed_games) : 0.0
    end

    def get_all_games_count
      Game.all.size.to_f
    end
  end
end