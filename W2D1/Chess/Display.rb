require_relative 'Board'
require_relative 'cursor'
require 'colorize'

class Display

  attr_reader :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    @board.grid.each_with_index do |row, i|
      colored_row = []
      row.each_with_index do |tile, j|
        if (i + j).even?
          background = "  ".colorize( :background => :black)
        else
          background = "  ".colorize( :background => :white)
        end
        if [i, j] == @cursor.cursor_pos
          background = "  ".colorize( :background => :red)
          if @cursor.selected
            background = "  ".colorize( :background => :green)
          end
        end
        colored_row << background
      end
      print "#{colored_row.join("")}\n"
    end
    nil

  end

end


if __FILE__ == $PROGRAM_NAME
  board = Board.new
  display = Display.new(board)
  while true
    system('clear')
    display.render
    display.cursor.get_input
  end
end
