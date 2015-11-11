class Game < ActiveRecord::Base
  has_many :moves
  belongs_to :player1, class_name: 'User'
  belongs_to :player2, class_name: 'User'

    def board
      empty_board.tap do |board|
        moves.each do |move|
          board[move.square] = move.symbol
        end
      end
    end

    def ai_playing?
      player2.try(:username) == "AI-Random"
    end

    def ai

    end

    def board_squared
      board.each_slice(3).to_a
    end

    def whose_turn
      return player1 if moves.empty?
      moves.last.player == player1 ? player2 : player1
    end

    def move_check?(player)
      player == self.whose_turn
    end

    def make_move(player, square)
      if move_check?(player) == true
        Move.create(square: square, symbol: symbol_for_player(player), player: player, game: self)
      else
        errors.add(:player, "It isn't your turn Mr Greedy!")
        Move.new
      end
    end

    def square_is_empty?(square)
        !board[square]
    end

    def finished?
      winning_game? || drawn_game?
    end

    def result
      case
      when drawn_game?
        "It is a draw!"
      when winning_game?
        "#{moves.last.player.username} won!"
      else
        "It's still in progress"
      end
    end

    WINNING_LINES = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]

    private
    def winning_game?
      !!WINNING_LINES.detect do |winning_line|
        %w(XXX OOO).include?(winning_line.map { |e| board[e] }.join)
      end
    end

    private
    def drawn_game?
      moves.size == 9
    end

    private
    def empty_board
      [nil,nil,nil,nil,nil,nil,nil,nil,nil]
    end

    private
    def symbol_for_player(player)
      case player
      when player1
        'X'
      when player2
        'O'
      else
        raise "who?! that's not one of my players!"
      end
    end
end