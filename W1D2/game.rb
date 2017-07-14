  require 'byebug'

require_relative 'card'
require_relative 'board'

class Game

  attr_accessor :previous_guess

  def initialize(board)
    @board = board
    @previous_guess = nil
    @matches = 0
  end

  def play
    until over?
      @board.render
      guess = prompt
      make_guess(guess)
    end

    puts "You won!"
  end

  def matched?(pos)
    unless pos == @previous_guess
      @board[pos].value == @board[@previous_guess].value
    end
  end

  def make_guess(pos)
    @board[pos].reveal
    @board.render

    if @previous_guess.nil?
      @previous_guess = pos
    else
      if matched?(pos)
        puts "Match!"
        @board[pos].reveal
        @board[@previous_guess].reveal
        @matches += 1
      else
        puts "No match!"
        @board[pos].hide
        @board[@previous_guess].hide
      end
      @previous_guess = nil
    end
  end

  def over?
    @board.won?(@matches)
  end

  def prompt
    puts "Make a guess in the form x,y"
    input = gets.chomp.split(",").map { |str| str.to_i }
    input
  end

end

if __FILE__ == $PROGRAM_NAME
  new_game = Game.new(Board.new)
  new_game.play
end
