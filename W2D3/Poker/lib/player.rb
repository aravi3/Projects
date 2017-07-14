require_relative 'deck'
class DiscardError < StandardError

end
class Player

  attr_accessor :hand, :folded, :deck, :chips
  attr_reader :name

  def initialize(name, deck)
    @name = name
    @deck = deck
    @hand = []
    @chips = 100
    @folded = false
  end

  def deal_cards
    until @hand.length == 5
      @hand << @deck.card_deck.pop
    end
  end

  def discard_prompt
    begin
      puts "Which cards would you like to discard, #{@name}? (card1, card2...)"
      input = gets.chomp.split(", ").map(&:to_i)
      raise DiscardError.new 'You can only discard up to 3 cards' if input.length > 3
    rescue DiscardError
      retry
    end
    discard(input.map! { |idx| idx - 1 }) unless input.empty?
  end

  def discard(selection)
    selection.each do |card|
      @hand[card] = nil
    end
    @hand.delete(nil)
    @hand
  end

  def bet_prompt(previous_bet, pot_size)
    puts "Would you like to (f)old, (c)all, or (r)aise, #{@name}?"
    input = gets.chomp
    case input
    when "f"
      fold
    when "c"
      call(previous_bet)
    when "r"
      raise_bet(previous_bet, pot_size)
    end
  end

  def fold
    @folded = true
    0
  end

  def call(previous_bet)
    @chips -= previous_bet
    previous_bet
  end

  def raise_bet(previous_bet, pot_size)
    puts "Pot: #{pot_size}, Previous bet: #{previous_bet}"
    puts "How much would you like to raise, #{@name}? Don't do a negative #"
    input = gets.chomp.to_i
    new_bet = previous_bet + input
    @chips -= new_bet
    new_bet
  end

end
