class Game < ApplicationRecord 
  include Playable

  scope :by_switched_and_won, -> { where(switched: true, won: true) }
  scope :by_switched, -> { where(switched: true) }
  scope :by_stayed_and_won, -> { where(switched: false, won: true) }
  scope :by_stayed, -> { where(switched: false) }
end
