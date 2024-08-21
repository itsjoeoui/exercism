class Triangle
  attr_reader :rows

  def initialize(size)
    @rows = 1.upto(size).map(&method(:row)).to_a
  end

  private

  def row(index)
    1.upto(index - 1).each_with_object([1]) do |j, elements|
      # example row(5)
      # --------------- = 1
      # 1 * (5 - 1) / 1 = 4
      # 4 * (5 - 2) / 2 = 6
      # 6 * (5 - 3) / 3 = 4
      # 4 * (5 - 4) / 4 = 1
      elements << elements.last * (index - j) / j
    end
  end
end
