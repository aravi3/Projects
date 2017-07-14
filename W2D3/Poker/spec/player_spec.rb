require_relative "../lib/player"

describe Player do

  describe "player behavior" do

    dummy_arr = []
    52.times { |i| dummy_arr << i }
    let(:deck) { double("Deck", :card_deck => dummy_arr) }
    subject(:player) { Player.new("George", deck) }

    context "#deal_cards" do
      it "makes sure that players have 5 cards in their hand" do
        player.deal_cards
        expect(player.hand.length).to eq(5)
      end
    end

    context "#discard_prompt" do
      it "discards cards properly" do
        player.deal_cards
        expect(player.discard([0, 1]).length).to eq(3)
      end
    end

  end

end
