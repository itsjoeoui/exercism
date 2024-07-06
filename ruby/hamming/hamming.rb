# Write your code for the 'Hamming' exercise in this file. Make the tests in
# `hamming_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/hamming` directory.

module Hamming
  def self.compute(strand1, strand2)
    raise ArgumentError unless strand1.length == strand2.length

    # strand1.chars.each_with_index.reduce(0) do |sum, (char, idx)|
    #   sum += 1 if strand2[idx] != char
    #   sum
    # end

    strand1.chars.zip(strand2.chars).count { |char1, char2| char1 != char2 }
  end
end
