# Write your code for the 'Word Count' exercise in this file. Make the tests in
# `word_count_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/word-count` directory.

class Phrase
  attr_reader :word_count

  def initialize(sentence)
    @word_count = sentence.downcase.scan(/\b[\w']+\b/).tally
  end
end
