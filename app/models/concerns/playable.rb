module Playable
  extend ActiveSupport::Concern

  module ClassMethods
    def open_door(index1, index2) 
      ([0,1,2] - [index1, index2]).first
    end

    def resolve_game(user_choice, open_door, car, switched)
      final_choice = switched ? self.open_door(user_choice, open_door) : user_choice
      (final_choice == car) ? true : false
    end

    def get_switching_success_rate(all_games_count)
      Game.by_switched_and_won.size.to_f / all_games_count
    end

    def get_staying_success_rate(all_games_count)
      stayed_and_won_games = Game.by_stayed_and_won
      Game.by_stayed_and_won.size.to_f / all_games_count 
    end

    def get_all_games_count
      Game.all.size.to_f
    end
  end
end