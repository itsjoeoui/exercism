class SumOfMultiples
  def initialize(*items)
    @items = items
  end

  def to(level)
    combine_and_dedup(*@items.map { |item| get_multiples(item, level) }).sum
  end

  private

  def get_multiples(item, level)
    return 0 if item.zero?

    (item...level).step(item).select { |num| num < level }
  end

  def combine_and_dedup(*values)
    values.flatten.uniq
  end
end
