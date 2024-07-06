# Write your code for the 'Series' exercise in this file. Make the tests in
# `series_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/series` directory.

class Series
  private

  attr_accessor :series

  def initialize(series)
    @series = series
  end

  public

  def slices(n)
    raise ArgumentError if n > series.length || n <= 0

    (0..series.length - n).map { |i| series[i, n] }
  end
end
