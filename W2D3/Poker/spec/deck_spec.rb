require_relative '../lib/deck'

describe Deck do
  subject(:deck) { Deck.new }
  let(:card) { double("card") }

  describe "#initialize" do

    it "initializes a shuffled deck of 52 cards" do
      expect(deck.card_deck.length).to eq(52)
    end
  end
end
