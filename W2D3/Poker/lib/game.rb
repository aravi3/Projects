require_relative 'deck'
require_relative 'player'
require_relative 'hand'
require 'byebug'
require 'colorize'
class Game

  WINNING_HANDS = [:high_card, :pair, :two_pair, :three_of_a_kind,
                 :straight, :flush, :full_house, :four_kind,
                 :straight_flush, :royal_flush]

  def initialize(*players)
    @players = players
    @pot = 0
    @previous_bet = 0
  end

  def play_round
    @players.each(&:deal_cards)
    render
    bet_round
    @previous_bet = 0
    discard_round
    render
    bet_round
    evaluate_round
    reset
  end

  def evaluate_round
    player_hands = []
    @players.each do |player|
      player_hands << Hand.new(player.hand)
    end

    player_hands.each_with_index do |hand, idx|
      player_hands[idx] = hand.evaluate_hand
    end

    winning_player_idx = -1
    player_hands.each_with_index do |hand, idx|
      if (WINNING_HANDS.index(hand[0]) > winning_player_idx) && !@players[idx].folded
        winning_player_idx = idx
      end
    end

    @players[winning_player_idx].chips += @pot
    puts "#{@players[winning_player_idx].name} won this round!"
  end

  def play
    until game_over?
      play_round
    end

    winner = @players.select { |player| player.chips > 0 }
    puts "#{winner[0].name} has won the game! Congratulations!!!"
  end

  def reset
    @pot = 0
    @previous_bet = 0
    deck = Deck.new
    @players.each { |player| player.deck = deck }
  end

  def game_over?
    count = 0

    @players.each do |player|
      count += 1 if player.chips == 0
    end

    return true if count == @players.length - 1
    false
  end

  def bet_round
    @players.each do |player|
      bet = player.bet_prompt(@previous_bet, @pot) unless player.folded
      @pot += bet
      @previous_bet = bet
    end
  end

  def discard_round
    @players.each do |player|
      unless player.folded
        player.discard_prompt
        player.deal_cards
      end
    end
  end

  def render
    @players.each do |player|
      puts "#{player.name}, #{player.chips} chips"
      puts "Hand: "
      player.hand.each do |card|
        print "#{card.type}, #{card.suit} | "
      end
      puts "\n\n"
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  deck = Deck.new
  player1 = Player.new("George", deck)
  player2 = Player.new("Lucas", deck)
  new_game = Game.new(player1, player2)

  new_game.play
end
