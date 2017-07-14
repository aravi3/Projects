require_relative 'tdd'

describe Array do

  describe "#remove_dupes" do

    it "removes dupes from an array" do
      expect([1, 2, 2, 3, 4].remove_dupes).to eq([1, 2, 3, 4])
    end

    it "removes dupes from an unsorted array" do
      expect([1, 4, 1, 3, 2, 2, 5].remove_dupes).to eq([1, 4, 3, 2, 5])
    end
  end

  describe "#two_sum" do

    it "finds all pairs where sum equals zero" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe "#my_transpose" do

    it "tranposes a square matrix" do
      original = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
      ]

      answer = [
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8]
      ]

      expect(original.my_transpose).to eq(answer)
    end
  end

  describe "#stock_picker" do

    it "picks days to buy/sell stocks (scenario 1)" do
      random = [4, 6, 2, 1, 7, 4, 5]
      expect(random.stock_picker).to eq([3, 4])
    end

    it "picks days to buy/sell stocks (scenario 1)" do
      random = [7, 4, 6, 1, 3, 6]
      expect(random.stock_picker).to eq([3, 5])
    end
  end
end

describe Towers do

  describe "#move" do
    dummy_arr = [[3, 2, 1], [], []]
    subject(:game) { Towers.new(dummy_arr) }

    it "makes a valid move" do
      expect(game.move(0, 1)).to eq([[3, 2], [1], []])
    end

    it "doesn't accept invalid moves" do
      game.move(0, 1)
      expect(game.valid_move?(0, 1)).to be false
    end
  end

  describe "#won?" do
    dummy_arr = [[3, 2, 1], [], []]
    subject(:game) { Towers.new(dummy_arr) }

    it "checks if the game is won" do
      game.move(0, 1)
      game.move(0, 2)
      game.move(1, 2)
      game.move(0, 1)
      game.move(2, 0)
      game.move(2, 1)
      game.move(0, 1)
      expect(game.won?).to be true
    end
  end
end
