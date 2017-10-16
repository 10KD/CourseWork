class Piece
  attr_accessor :current_pos
  attr_reader :color

  def initialize(current_pos, color, board)
    @current_pos = current_pos
    @color = color
    @board = board
  end


end
