class Game < ApplicationRecord 
  include Playable

  scope :by_switched_and_won, -> { where(switched: true, won: true) }
  scope :by_stayed_and_won, -> { where(switched: false, won: true) }

  def self.create_doors
    doors = [false, false, false]
    doors[rand(3)] = true   
    doors
  end
end
