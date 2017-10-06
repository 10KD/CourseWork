

class HumanPlayer

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def prompt(game)
    puts "Pick a position #{@name}"
    pos = gets.chomp.split(',').map(&:to_i)
    until game.valid_guess?(pos)
      puts "please choose a valid position!"
      pos = gets.chomp.split(',').map(&:to_i)
    end
    pos
  end

end
