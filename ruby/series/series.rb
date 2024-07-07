class Series

  private

  attr_accessor :series

  def initialize(series)
    self.series = series
  end

  public

  def slices(length)
    raise InvalidSeriesError unless (1..series.length).cover?(length)

    (0..series.length - length).map { |i| series[i, length] }
  end

end

class InvalidSeriesError < ArgumentError

  def initialize(message = 'Slice length must be a positive number up to the series length')
    super
  end

end
