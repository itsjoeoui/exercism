# Write your code for the 'Scrabble Score' exercise in this file. Make the tests in
# `scrabble_score_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/scrabble-score` directory.

class Scrabble
  SCORES_MAP = {
    'a' => 1, 'e' => 1, 'i' => 1, 'o' => 1, 'u' => 1, 'l' => 1, 'n' => 1,
    'r' => 1, 's' => 1, 't' => 1, 'd' => 2, 'g' => 2, 'b' => 3, 'c' => 3,
    'm' => 3, 'p' => 3, 'f' => 4, 'h' => 4, 'v' => 4, 'w' => 4, 'y' => 4,
    'k' => 5, 'j' => 8, 'x' => 8, 'q' => 10, 'z' => 10

  }
  SCORES_MAP.default = 0
  private_constant :SCORES_MAP

  attr_reader :word

  def initialize(word)
    @word = word.to_s.downcase
  end

  def score
    @word.downcase.chars.sum { |char| SCORES_MAP[char] }
  end
end
