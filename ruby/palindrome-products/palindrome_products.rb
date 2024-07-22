# Write your code for the 'Palindrome Products' exercise in this file. Make the tests in
# `palindrome_products_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/palindrome-products` directory.

class Value
  attr_reader :value, :factors

  def initialize(value, factors)
    @value = value
    @factors = factors
  end
end

class Palindromes
  attr_reader :largest, :smallest

  def initialize(max_factor:, min_factor: 1)
    @max_factor = max_factor
    @min_factor = min_factor
    @factor_cache = Hash.new { |h, k| h[k] = [] }
  end

  def generate
    min, max = combs.select { |a, b| palindrome?(a * b) }
                    .each { |a, b| @factor_cache[a * b] << [a, b] }
                    .map { |a, b| a * b }
                    .minmax

    @smallest = Value.new(min, factors_for(min))
    @largest = Value.new(max, factors_for(max))
  end

  private

  def combs
    (@min_factor..@max_factor).to_a.repeated_combination(2)
  end

  def factors_for(value)
    @factor_cache[value]
  end

  def palindrome?(num)
    num.to_s == num.to_s.reverse
  end
end
