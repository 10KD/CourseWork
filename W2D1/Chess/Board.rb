require_relative 'Piece'
require_relative 'NullPiece'
require_relative 'bishop'
require_relative 'king'
require_relative 'knight'
require_relative 'pawn'
require_relative 'queen'
require_relative 'rook'




class Board
  attr_reader :grid
  WHITE_START = [Rook.new([0, 0], "white", self),
                 Knight.new([0, 1], "white", self),
                 Bishop.new([0, 2], "white", self),
                 Queen.new([0, 3], "white", self),
                 King.new([0, 4], "white", self),
                 Bishop.new([0, 5], "white", self),
                 Knight.new([0, 6], "white", self),
                 Rook.new([0, 7], "white", self)]

BLACK_START = [Rook.new([7, 0], "black", self),
               Knight.new([7, 1], "black", self),
               Bishop.new([7, 2], "black", self),
               Queen.new([7, 3], "black", self),
               King.new([7, 4], "black", self),
               Bishop.new([7, 5], "black", self),
               Knight.new([7, 6], "black", self),
               Rook.new([7, 7], "black", self)]



  def initialize
    @grid = create_board
  end

  def create_board
    board = Array.new(8) { Array.new(8) { [nil] } }
    p board
    #returning 1D board with rook at 0 and 7
    WHITE_START.each do |piece|
      board[piece.current_pos[0], piece.current_pos[1]] = piece
    end
    BLACK_START.each do |piece|
      board[piece.current_pos[0], piece.current_pos[1]] = piece
    end
    p board
    board[1].map!.with_index { |el, i| Pawn.new([1, i], "white", self)}
    board[6].map!.with_index { |el, i| Pawn.new([6, i], "black", self)}
    board
  end

  def [](pos)
    x, y = pos[0], pos[1]
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos[0], pos[1]
    @grid[x][y] = value
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos] == nil
      raise "No piece available at that position."
    elsif !valid_position?(end_pos)
      raise "Invalid end position."
    else
      self[end_pos] = self[start_pos]
      self[start_pos] = nil
      self[end_pos].current_pos = end_pos
    end
  end

  def valid_position?(end_pos)
    end_pos.all? { |coor| (0..7).cover?(coor) }
  end

end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  board.grid

end
