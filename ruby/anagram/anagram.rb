# Write your code for the 'Anagram' exercise in this file. Make the tests in
# `anagram_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/anagram` directory.

class Anagram
  private

  attr_reader :rejections, :selections

  def initialize(word)
    word = word.downcase
    letters = word.chars.sort
    @rejections = ->(candidate) { candidate.downcase == word }
    @selections = ->(candidate) { candidate.downcase.chars.sort == letters }
  end

  public

  def match(candidates)
    candidates.reject(&rejections).select(&selections)
  end
end
