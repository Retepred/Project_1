class Board < ActiveRecord::Base
  belongs_to :games
  has_and_belongs_to :tictacto
  has_many :cells
end