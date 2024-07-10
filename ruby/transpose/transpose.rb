# Write your code for the 'Transpose' exercise in this file. Make the tests in
# `transpose_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/transpose` directory.

class Transpose
  def self.transpose(input)
    new(input).transpose
  end

  attr_reader :rows

  def initialize(input)
    @rows = input.lines(chomp: true)
  end

  def transpose
    rows.map(&method(:pad)).map(&:chars).transpose.map(&method(:unpad)).join("\n")
  end

  def pad(row)
    row.ljust(rows.map(&:size).max, PADDING_CHAR)
  end

  def unpad(col)
    col.join.gsub(TRAILING_PADDING_CHARS, '').tr(PADDING_CHAR, ' ')
  end

  PADDING_CHAR = "\u0080".freeze
  TRAILING_PADDING_CHARS = /#{PADDING_CHAR}+$/.freeze

  private_constant :PADDING_CHAR, :TRAILING_PADDING_CHARS
end
