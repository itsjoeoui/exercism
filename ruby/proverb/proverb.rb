# Write your code for the 'Proverb' exercise in this file. Make the tests in
# `proverb_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/proverb` directory.

class Proverb
  STANDARD_LINE = "For want of a %s the %s was lost.\n"
  ENDING_LINE = 'And all for the want of a %s.'

  private_constant :STANDARD_LINE, :ENDING_LINE

  attr_reader :desires, :qualifier

  def initialize(*desires, qualifier: nil)
    @desires = desires
    @qualifier = qualifier
  end

  def to_s
    lines.join + ENDING_LINE % ending
  end

  def lines
    desires.each_cons(2).map do |a, b|
      format(STANDARD_LINE, a, b)
    end
  end

  def ending
    [qualifier, desires.first].compact.join(' ')
  end
end
