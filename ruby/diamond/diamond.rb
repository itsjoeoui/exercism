# Write your code for the 'Diamond' exercise in this file. Make the tests in
# `diamond_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/diamond` directory.

class Diamond
  def self.make_diamond(letter)
    new(letter).make
  end

  def initialize(letter)
    @letters = ('A'..letter).to_a
  end

  attr_reader :letters

  def make
    lines = letters.map.with_index do |letter, index|
      make_line(letter, index)
    end

    (lines + lines.reverse.drop(1)).join
  end

  def make_line(letter, index)
    outer_space = ''.ljust(letters.size - index - 1)
    inner_space = ''.ljust(index * 2 - 1)

    if letter == 'A'
      "#{outer_space}#{letter}#{outer_space}\n"
    else
      "#{outer_space}#{letter}#{inner_space}#{letter}#{outer_space}\n"
    end
  end
end
