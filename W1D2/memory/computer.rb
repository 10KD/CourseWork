

class ComputerPlayer

  attr_reader :name, :known_cards

  def initialize(name = "Computer")
    @name = name
    @known_cards = {}
    @do_not_pick = []
  end

  def prompt(game)

  end


  def receive_revealed_card(value, pos)
    @known_cards[value] += pos
  end

  def receive_match(pos1, pos2)
    @matched_cards =
  end

end




values_arr = @known_cards.values
match = nil
values_arr.each_index do |i|
  i2 = i + 1
  (i2...values_arr.length).each do |j|
    match = values_arr[i] if values_arr[i] == values_arr[j]
  end
end

matching_positions = []
if match
  @known_cards.each do |k, v|
    if @known_cards[k] == match
      matching_positions << k
      @known_cards.delete(k)
    end

  end

  pos = matching_positions.sample
  @do_not_pick << pos
  p @do_not_pick



else

 @known_cards.each do |v, p|
   if v == previous_guess_value && p != previous_guess_position
      pos = p
   end
 end


  arr = (0..3).to_a
  idx1 = arr.sample
  idx2 = arr.sample
  pos = [idx1, idx2]
  until game.valid_guess?(pos, self)
    idx1 = arr.sample
    idx2 = arr.sample
    pos = [idx1, idx2]
  end
  value = game.board[pos].face_value
  receive_revealed_card(value, pos)
end

def
p pos
pos
