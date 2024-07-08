# Write your code for the 'Grains' exercise in this file. Make the tests in
# `grains_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/grains` directory.

module Grains
  def self.square(number)
    raise ArgumentError if number < 1 || number > 64

    2**(number - 1)
  end

  def self.total
    (1..64).sum { |n| square(n) }
  end
end
