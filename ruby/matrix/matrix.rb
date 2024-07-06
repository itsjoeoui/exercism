# Write your code for the 'Matrix' exercise in this file. Make the tests in
# `matrix_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/matrix` directory.

class Matrix
  private

  attr_reader :rows, :columns

  def initialize(matrix)
    @rows = matrix.split("\n").map { |row| row.split.map(&:to_i) }
    @columns = @rows.transpose
  end

  public

  def column(offset)
    @columns[offset - 1]
  end

  def row(offset)
    @rows[offset - 1]
  end
end
