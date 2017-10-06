class Player

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def guess
    puts "type letter, #{self.name}: "
    gets.chomp
  end

end
