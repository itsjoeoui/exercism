class BookStore
  def self.calculate_price(basket)
    new.calculate_price(basket.tally)
  end

  def initialize
    @memo = {
      {} => 0 # base case
    }
  end

  DISCOUNTS = [1, 0.95, 0.90, 0.80, 0.75].freeze
  private_constant :DISCOUNTS

  def calculate_price(basket)
    return @memo[basket] if @memo[basket] # momorization

    total = (1..(basket.size < 5 ? basket.size : 5)).reverse_each.map do |i|
      i * 8 * DISCOUNTS[i - 1] + calculate_price(remove_n_distinct(basket.dup, i))
    end.min

    @memo[basket] = total

    total
  end

  def remove_n_distinct(basket, n)
    basket.sort_by { |_k, v| -v }.first(n).each do |k, _|
      basket[k] -= 1
      basket.delete(k) if basket[k].zero?
    end

    basket
  end
end
