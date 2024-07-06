# Write your code for the 'Clock' exercise in this file. Make the tests in
# `clock_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/clock` directory.

class Clock
  MINS_PER_HOUR = 60
  MINS_PER_DAY = 1440

  protected

  attr_reader :time

  public

  def initialize(hour: 0, minute: 0)
    @time = (hour * MINS_PER_HOUR + minute) % MINS_PER_DAY
  end

  def to_s
    format('%02d:%02d', *@time.divmod(MINS_PER_HOUR))
  end

  def +(other)
    Clock.new(minute: @time + other.time)
  end

  def -(other)
    Clock.new(minute: @time - other.time)
  end

  def ==(other)
    time.eql?(other.time)
  end
  alias eql? ==
end
