# Write your code for the 'Triangle' exercise in this file. Make the tests in
# `triangle_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/triangle` directory.

class Triangle
  attr_reader :sides

  def initialize(sides)
    @sides = sides.sort
  end

  def equilateral?
    sides.all? { |side| side == sides.first } && valid?
  end

  def valid?
    sides.none?(0) && sides[0] + sides[1] > sides[2]
  end

  def isosceles?
    sides.uniq.size <= 2 && valid?
  end

  def scalene?
    sides.uniq.size == 3 && valid?
  end
end
