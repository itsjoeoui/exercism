class Darts
  attr_reader :score

  def initialize(x, y)
    @score = case radius(x, y)
             when 0..1
               10
             when 1..5
               5
             when 5..10
               1
             else
               0 end
  end

  private

  def radius(x, y)
    Math.sqrt(x**2 + y**2)
  end
end
