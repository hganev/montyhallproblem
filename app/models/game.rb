class Game < ApplicationRecord

  scope :by_switched_and_won, -> { where(switched: true, won: true) }
  scope :by_stayed_and_won, -> { where(switched: false, won: true) }

  def self.create_doors
    doors = [false, false, false]
    doors[rand(3)] = true   
    doors
  end

  def self.open_door(index1, index2) 
    ([0,1,2] - [index1, index2]).first
  end

  def self.resolve_game(user_choice, open_door, car, switched)
    final_choice = switched ? self.open_door(user_choice, open_door) : user_choice
    (final_choice == car) ? true : false
  end

  def self.get_switching_success_rate(all_games_count)
    Game.by_switched_and_won.size.to_f / all_games_count
  end

  def self.get_staying_success_rate(all_games_count)
    stayed_and_won_games = Game.by_stayed_and_won

    # in Bayes' theorem, the divider cannot be 0
    stayed_and_won_games = stayed_and_won_games == 0 ? 1.0 : stayed_and_won_games
    Game.by_stayed_and_won.size.to_f / all_games_count 
  end

  def self.get_all_games_count
    Game.all.size.to_f
  end

end
