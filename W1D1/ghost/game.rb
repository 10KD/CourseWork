require_relative "player.rb"
require_relative "aiplayer.rb"
require 'byebug'

class Game
  attr_accessor :dictionary, :player1, :player2, :active, :fragment

  def initialize(players)
    @players = Array.new
    players.each { |player| @players << player }
    @player_index = 0
    @active = @players[@player_index]
    @fragment = ""
    @losses = {}
    @players.each { |player| @losses[player.name] = 0 }
    @dictionary = {}
    File.readlines('dictionary.txt').map(&:chomp).each do |line|
      @dictionary[line] = true
    end
  end

  def next_player!
    @player_index += 1
    @player_index = @player_index % @players.length
    self.active = @players[@player_index]
  end

  def take_turn(player)
    puts "current fragmet: #{@fragment}"
    player.guess
  end

  def play_round
    # until @losses.values.any? { |val| val == 5 }
    until @players.length == 1
      letter = self.take_turn(active)

      if valid_play?(@fragment + letter)
        @fragment += letter
        self.next_player!
      else
        puts "you lose the round, #{active.name}"
        @losses[active.name] += 1
        @fragment = ""
        puts "#{active.name} has #{record(active)}"
        if @losses[active.name] == 5
          puts "#{active.name} you're out!"
          @players.delete_at(@player_index)
          @active = @players[@player_index]
          puts "#{active.name} goes next!"
        end
      end
    end
    puts "game over, #{active.name} won!" #
  end

  def record(player)
    string = "GHOST"
    if @losses[player.name] == 0
      return ""
    else
      string[0...@losses[player.name]]
    end
  end


  def valid_play?(string)

    if @dictionary.keys.any? { |key| key.match(string)}
      return true if @dictionary.keys.all? { |key| key != string }
    end
    false
  end

end

if $PROGRAM_NAME == __FILE__
  players = []
  name = nil
  until name == "done"
    print "enter player name, or enter 'done' to begin game "
    name = gets.chomp.strip
    players << Player.new(name) unless name == "done"
  end

  new_game = Game.new(players)
  new_game.play_round
end
