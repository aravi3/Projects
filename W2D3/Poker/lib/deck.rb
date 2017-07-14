require_relative 'card'

class Deck

CARD_TYPES = [
  :two,
  :three,
  :four,
  :five,
  :six,
  :seven,
  :eight,
  :nine,
  :ten,
  :jack,
  :queen,
  :king,
  :ace
]

CARD_SUITS = [
  :spade,
  :club,
  :heart,
  :diamond
]

attr_accessor :card_deck

def initialize
  @card_deck = []
  create_deck
end

  def create_deck
    CARD_TYPES.each do |type|
      CARD_SUITS.each do |suit|
        @card_deck << Card.new(type, suit)
      end
    end
    @card_deck.shuffle!
  end

end
