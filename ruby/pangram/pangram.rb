# Write your code for the 'Pangram' exercise in this file. Make the tests in
# `pangram_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/pangram` directory.

module Pangram
  def self.pangram?(sentence)
    # ('a'..'z').all? { |char| sentence.downcase.include?(char) }

    sentence.downcase.scan(/[a-z]/i).uniq.size == 26
  end
end
