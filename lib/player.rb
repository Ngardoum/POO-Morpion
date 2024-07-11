class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def move(board)
    loop do
      puts "#{name}, entrez la ligne (0-2) et la colonne (0-2) pour placer votre #{symbol}:"
      row, col = gets.chomp.split.map(&:to_i)
      if board.valid_move?(row, col)
        board.update_grid(row, col, symbol)
        break
      else
        puts "Mouvement invalide. Réessayez."
      end
    end
  end
end
