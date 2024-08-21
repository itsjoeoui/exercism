class Yacht
  attr_reader :dice, :category

  def initialize(dice, category)
    @dice = dice
    @category = category
  end

  def score
    case category
    when 'ones'
      count(1)
    when 'twos'
      count(2)
    when  'threes'
      count(3)
    when  'fours'
      count(4)
    when 'fives'
      count(5)
    when  'sixes'
      count(6)
    when  'full house'
      dice.tally.values.sort == [2, 3] ? dice.sum : 0
    when  'four of a kind'
      dice.tally.values.max >= 4 ? dice.max * 4 : 0
    when  'little straight'
      dice.sort == [1, 2, 3, 4, 5] ? 30 : 0
    when  'big straight'
      dice.sort == [2, 3, 4, 5, 6] ? 30 : 0
    when  'choice'
      dice.sum
    when  'yacht'
      dice.uniq.size == 1 ? 50 : 0
    end
  end

  private

  def count(element)
    @dice.count(element) * element
  end
end
