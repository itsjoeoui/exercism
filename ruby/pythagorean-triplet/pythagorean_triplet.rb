# Write your code for the 'Pythagorean Triplet' exercise in this file. Make the tests in
# `pythagorean_triplet_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/pythagorean-triplet` directory.

module PythagoreanTriplet
  def self.triplets_with_sum(limit)
    (1..limit / 3).each_with_object([]) do |a, triplets|
      b = (limit**2 - 2 * limit * a) / (2 * limit - 2 * a)
      c = limit - a - b

      next if b < a || c < b

      triplets << [a, b, c] if a**2 + b**2 == c**2
    end
  end
end
