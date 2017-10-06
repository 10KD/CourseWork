require_relative 'card.rb'

class Board

  attr_reader :grid

  DECK = (1..8).to_a * 2

  def initialize(grid = Array.new(4) { Array.new(4) })
    @grid = grid
  end

  def populate
    arr = DECK.dup
    arr.shuffle!
    i = 0
    self.grid.each do |row|
      row.map! do |slot|
        card = Card.new(arr[i])
        i += 1
        card
      end
    end
  end

  # def card_num
  #
  #   result = arr[0]
  #   arr.shift
  #   result
  # end


  def render
    arr = Array.new(4) { Array.new(4) }
    # arr1 = Array.new(4) { Array.new(4) }
    # @grid.each_with_index do |row, i|
    #   row.each_with_index do |card, j|
    #     #arr[i][j] = card.face_up ? card.face_value : 0
    #     arr1[i][j] = card.face_value
    #   end
    #   p arr1[i]
    # end

    @grid.each_with_index do |row, i|
      row.each_with_index do |card, j|
        arr[i][j] = card.face_up ? card.face_value : 0
      end
      p arr[i]
    end
    arr
  end

  def won?
    @grid.all? do |row|
      row.all? do |card|
        card.face_up == true
      end
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def reveal(guess_pos)
    self[guess_pos].face_up = true
    self[guess_pos].face_value
  end



end
