class Card < Struct.new(:card)
  def rank
    %w[2 3 4 5 6 7 8 9 10 J Q K A].index(value)
  end

  def value
    card.chop
  end

  def suit
    card[-1]
  end

  def to_s
    card
  end
end

class Hand
  def initialize(cards)
    @cards = cards.map { |c| Card.new(c) }
  end

  def to_a
    @cards.map(&:to_s)
  end

  def rank
    [
      straight_flush?.to_s,
      four_of_a_kind?.to_s,
      full_house?.to_s,
      flush?.to_s,
      straight?.to_s,
      ace_low_straight?.to_s,
      three_of_a_kind?.to_s,
      two_pair?.to_s,
      pair?.to_s,
      card_ranks
    ].to_s
  end

  private

  def straight_flush?
    (straight? || ace_low_straight?) && flush?
  end

  def four_of_a_kind?
    group_sizes == [4, 1]
  end

  def full_house?
    group_sizes == [3, 2]
  end

  def flush?
    suits.uniq.size == 1
  end

  def straight?
    ranks.uniq.size == 5 && ranks.max - ranks.min == 4
  end

  def ace_low_straight?
    values.sort == %w[2 3 4 5 A]
  end

  def three_of_a_kind?
    group_sizes == [3, 1, 1]
  end

  def two_pair?
    group_sizes == [2, 2, 1]
  end

  def pair?
    group_sizes == [2, 1, 1, 1]
  end

  def card_ranks
    ranks.sort_by { |r| [-ranks.count(r), -r] }
  end

  def group_sizes
    ranks.tally.values.sort.reverse
  end

  def ranks
    @cards.map(&:rank)
  end

  def suits
    @cards.map(&:suit)
  end

  def values
    @cards.map(&:value)
  end
end

class Poker
  def initialize(hands)
    @hands = hands.map { |h| Hand.new(h) }
  end

  def best_hand
    @hands.group_by(&:rank).max[1].map(&:to_a)
  end
end
