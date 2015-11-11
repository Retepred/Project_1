class Move < ActiveRecord::Base
  belongs_to :game
  belongs_to :player, class_name: 'User'

  validate :square_is_empty
  validate :is_game_over


    private
    def square_is_empty
      errors.add(:player, "square is already taken") unless game.square_is_empty?(square)
    end

    private
    def is_game_over
      errors.add(:player, "The game has finished. Move on. It's over.") unless !game.finished?
    end

end
