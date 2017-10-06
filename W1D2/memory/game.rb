require_relative 'card.rb'
require_relative 'board.rb'
require_relative 'human.rb'
require_relative 'computer.rb'

class Game

  attr_reader :board, :player

  def initialize(player)
    @player = player
    @board = Board.new
    board.populate
  end

  def play

    until board.won?
      # system("clear")
      pos1 = take_turn
      pos2 = take_turn
      check_match(pos1, pos2)
    end
    puts "You win!"
  end

  def take_turn
    board.render
    pos = player.prompt(self)
    board[pos].reveal
    pos
  end

  def valid_guess?(pos, computer)
    board[pos].face_up == false || computer.do_not_pick.include?(pos)
  end

  def check_match(pos1, pos2)
    board.render
    if board[pos1].face_value != board[pos2].face_value
      board[pos1].hide
      board[pos2].hide
      puts "sorry no match"
    else
      puts "you got a match!"
    end
    sleep(3)
  end
end

Game.new(ComputerPlayer.new("kiki")).play
