# Write your code for the 'Alphametics' exercise in this file. Make the tests in
# `alphametics_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/alphametics` directory.

class Alphametics
  ALPHA = /[a-z]/

  def self.solve(puzzle)
    Alphametics.new(puzzle).solve
  end

  def initialize(puzzle)
    @puzzle = puzzle.downcase
  end

  def solve
    all_combs.each do |values|
      return letters.map(&:upcase).zip(values).to_h if solver.call(values)
    end
    {}
  end

  private

  attr_reader :solver, :letters

  def all_combs
    parse unless solver
    (0..9).to_a.permutation(letters.size)
  end

  def parse
    left, right = @puzzle.split(' == ')
    left_terms = left.split(' + ')
    right_term = right

    @letters = @puzzle.scan(ALPHA).unshift(right_term.chr).uniq
    @solver = build_solver(left_terms, right_term)
  end

  def build_solver(left, right)
    arguments = letters.join(', ')
    left_side_equals_right = "#{to_code(left)} == #{to_code(right)}"
    first_digit_never_zero = first_letters.map { |x| "(#{x} != 0)" }.join(' && ')
    eval ''"
      Proc.new do |#{arguments}|
        #{first_digit_never_zero} && #{left_side_equals_right}
      end
    "''
  end

  def first_letters
    @puzzle.scan(/\b#{ALPHA}/).uniq
  end

  # convert "ABC" into Ruby code `a*100 + b*10 + c`
  def to_code(term)
    return term.map(&method(:to_code)).join(' + ') if term.is_a? Array

    term.reverse
        .each_char.with_index
        .map { |x, i| i > 0 ? "#{x}*#{10**i}" : x }
        .reverse.join(' + ')
  end
end
