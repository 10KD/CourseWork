class Board
  def initialize(grid = Array.new(9) { Array.new(9) { 0 } })
    @grid = grid
    self.populate_bombs
    self.populate_counts
  end

  def populate_bombs
    9.times do |i|
      @grid[bomb_position][bomb_position] = "BOMB!"
    end
  end

  def populate_counts
    @grid.each_with_index do |row, i|
      row.each_with_index do |el, j|
        if el.is_a?(String)
          near_bomb_count(i, j)
        end
      end
    end
  end

  def near_bomb_count(row, col)
    (row - 1).upto(row + 1).each do |row_sub|
      (col - 1).upto(col + 1).each do |col_sub|
        unless @grid[row_sub][col_sub].is_a?(String)
          @grid[row_sub][col_sub] += 1
        end
      end
    end
  end

  def bomb_position
    rand(9)
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def column
    rows.transpose
  end

  def render
    puts grid
  end

  def reveal
  end

end

class Minesweeper
  attr_accessor :gameover

  def initialize(board = Board.new)
    @gameover = false
    @board = board
  end


  def run
    until won? || gameover
      board.render
      take_turn
    end
  end


  def won?
    board.any? do |row|
      !row.any? do |col|
        col == 0
      end
    end
  end



  def take_turn
    until valid_pos(pos) && pos
      puts "Pick a position i.e. (0,1): "
      pos = parse_pos(gets.chomp)
    end
    if isbomb?(pos)
      "BOOM!"
      @gameover = true
    end
  end

  def valid_pos(pos)
    board[pos] == 0
  end

  def isbomb?(pos)
    board[pos].is_a?(String)
  end

  def parse_pos(pos)
    pos.split(",").map { |char| Integer(char) }
  end
end

game = Minesweeper.new
game.run
