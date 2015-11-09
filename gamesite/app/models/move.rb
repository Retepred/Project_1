class Move < ActiveRecord::Base
  belongs_to :game
  belongs_to :player, class_name: 'User'

  # def initialize(square, symbol, player)
  #   @square = square
  #   @symbol = symbol
  #   @player = player
  # end








end
