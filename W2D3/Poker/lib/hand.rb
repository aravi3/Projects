require_relative 'card'

class Hand

  CARD_TYPES = [
    :ace,
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

  attr_accessor :cards, :type_hash, :suit_hash

  def initialize(cards)
    @cards = cards
    count_cards
    evaluate_hand
  end

  def evaluate_hand
    result = [false, nil]
    method_array = [royal_flush, straight_flush, four_kind,
                    full_house, flush, straight, three_of_a_kind,
                    two_pair, pair, high_card]

    # return royal_flush if royal_flush[0]
    # return straight_flush if straight_flush[0]
    # return four_kind if four_kind[0]
    # return full_house if full_house[0]
    # return flush if flush[0]
    # return straight if straight[0]
    # return three_of_a_kind if three_of_a_kind[0]
    # return two_pair if two_pair[0]
    # return pair if pair[0]
    # return high_card if high_card[0]

    method_array.each do |method|
      result = method
      return result if result[0]
    end
  end

  def count_cards
    @type_hash = Hash.new(0)
    @suit_hash = Hash.new(0)

    @cards.each do |card|
      @type_hash[card.type] += 1
      @suit_hash[card.suit] += 1
    end
  end

  def royal_flush
    cards = [:jack, :ten, :king, :queen, :ace]
    cards.each do |card|
      return [false, nil] unless @type_hash[card] == 1
    end
    [:royal_flush, nil]
  end

  def straight_flush
    return [:straight_flush, straight[1]] if straight[0] && flush[0]
    [false, nil]
  end

  def straight
    result = [false, nil]

    CARD_TYPES.each_index do |idx1|
      break if CARD_TYPES[idx1] == :jack
      result = [:straight, idx1]
      (idx1..idx1 + 4).each do |idx2|
        unless @type_hash[CARD_TYPES[idx2]] == 1
          result = [false, nil]
        end
      end
    end

    result
  end

  def flush
    result = [false, nil]

    @suit_hash.each do |key, val|
      result = [:flush, key] if val == 5
    end

    result
  end

  def full_house
    result = [false, nil]
    pair_count = 0
    three_count = 0
    higher_idx = 0
    @type_hash.each do |key, val|
      if val == 3 || val == 2
        three_count += 1 if val == 3
        pair_count += 1 if val == 2
        if CARD_TYPES.index(key) > higher_idx
          higher_idx = CARD_TYPES.index(key)
        end
        if three_count == 1 && pair_count == 1
          result = [:full_house, higher_idx]
        end
      end
    end
    result
  end

  def four_kind
    result = [false, nil]

    @type_hash.each do |key, val|
      result = [:four_of_a_kind, key] if val == 4
    end

    result
  end

  def three_of_a_kind
    result = [false, nil]

    @type_hash.each do |key, val|
      result = [:three_of_a_kind, key] if val == 3
    end

    result
  end

  def pair
    result = [false, nil]

    @type_hash.each do |key, val|
      result = [:pair, key] if val == 2
    end

    result
  end

  def two_pair
    count = 0
    higher_idx = 0

    @type_hash.each do |key, val|
      if val == 2
        if CARD_TYPES.index(key) > higher_idx
          higher_idx = CARD_TYPES.index(key)
        end
        count += 1
      end
    end

    return [:two_pair, higher_idx] if count == 2
    [false, nil]
  end

  def high_card
    highest_idx = 0

    @type_hash.keys.each do |key|
      if CARD_TYPES.index(key) > highest_idx
        highest_idx = CARD_TYPES.index(key)
      end
    end

    [:high_card, highest_idx]
  end
end
