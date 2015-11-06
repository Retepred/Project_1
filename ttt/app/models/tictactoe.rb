class Tictactoe < ActiveRecord::Base
  belongs_to :games
  has_and_belongs_to :board
end