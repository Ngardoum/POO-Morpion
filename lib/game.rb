require_relative 'board'
require_relative 'player'

class Game
  attr_reader :current_player, :board, :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = Board.new
    @current_player = player1
  end

  def play
    loop do
      board.display

      current_player.move(board)

      if game_over?
        board.display
        announce_winner
        break unless play_again?
        reset_game
      end

      switch_player
    end
  end

  private

  def switch_player
    @current_player = (@current_player == player1 ? player2 : player1)
  end

  def game_over?
    board.winning_combination?(current_player.symbol) || board.full?
  end

  def announce_winner
    if board.winning_combination?(current_player.symbol)
      puts "#{current_player.name} remporte la partie !"
    else
      puts "Match nul !"
    end
  end

  def play_again?
    print "Voulez-vous jouer une autre partie ? (oui/non) : "
    answer = gets.chomp.downcase
    answer == 'oui'
  end

  def reset_game
    @board = Board.new
    @current_player = player1
  end
end
