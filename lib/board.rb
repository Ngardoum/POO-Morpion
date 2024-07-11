class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(3) { Array.new(3, " ") }
  end

  def display
    puts "   0   1   2 "
    @grid.each_with_index do |row, index|
      puts "#{index} #{row.map { |cell| cell.empty? ? " " : cell }.join(" | ")}"
      puts "  ---|---|---" unless index == 2
    end
  end

  def update_grid(row, col, symbol)
    @grid[row][col] = symbol
  end

  def valid_move?(row, col)
    row.between?(0, 2) && col.between?(0, 2) && @grid[row][col] == " "
  end

  def winning_combination?(symbol)
    
    (0..2).any? { |i| @grid[i].all? { |cell| cell == symbol } } ||
    (0..2).any? { |i| @grid.all? { |row| row[i] == symbol } } ||
    [@grid[0][0], @grid[1][1], @grid[2][2]].all? { |cell| cell == symbol } ||
    [@grid[0][2], @grid[1][1], @grid[2][0]].all? { |cell| cell == symbol }
  end

  def full?
    @grid.flatten.none? { |cell| cell == " " }
  end
end
