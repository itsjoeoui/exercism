class Series
  attr_reader :series

  def initialize(series)
    raise ArgumentError unless series.match?(/^\d+$/)

    @series = series.chars.map(&:to_i)
  end

  def largest_product(span)
    raise ArgumentError if span > series.length || span.negative?

    @series.each_cons(span).map { |group| group.inject(:*) }.max || 1
  end
end
