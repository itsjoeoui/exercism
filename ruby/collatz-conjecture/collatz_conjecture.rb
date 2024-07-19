# Write your code for the 'Collatz Conjecture' exercise in this file. Make the tests in
# `collatz_conjecture_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/collatz-conjecture` directory.

module CollatzConjecture
  def self.steps(num)
    raise ArgumentError if num <= 0

    helper(num, 0)
  end

  def self.helper(num, acc)
    if num == 1
      acc
    elsif num.even?
      helper(num / 2, acc + 1)
    else
      helper(3 * num + 1, acc + 1)
    end
  end
end
