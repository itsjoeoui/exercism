# frozen_string_literal: true

# Given a string of digits, output all the contiguous substrings of
# length `n` in that string in the order that they appear.
class Series
  private

  attr_accessor :series

  def initialize(series)
    @series = series
  end

  public

  def slices(length)
    raise ArgumentError unless (1..series.length).cover?(length)

    (0..series.length - length).map { |i| series[i, length] }
  end
end
