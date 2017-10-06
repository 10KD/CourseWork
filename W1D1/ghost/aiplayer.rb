class Player

  attr_accessor :name

  def initialize(name)
    @name = name
    @dictionary = {}
    File.readlines('dictionary.txt').map(&:chomp).each do |line|
      @dictionary[line] = true
    end
  end

  def guess(fragment) #return guessed letter
    arr = []
    arr << @dictionary.keys.all { |key| key.match(string)}

  end

end
