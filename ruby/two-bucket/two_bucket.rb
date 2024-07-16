# Write your code for the 'Two Bucket' exercise in this file. Make the tests in
# `two_bucket_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/two-bucket` directory.

class Bucket
  attr_reader :name, :size
  attr_accessor :level

  def initialize(name, size)
    @name = name
    @size = size
    @level = 0
  end

  def room
    @size - @level
  end

  def fill
    @level = @size
  end

  def empty
    @level = 0
  end

  def full?
    @level == @size
  end

  def empty?
    @level.zero?
  end

  def pour_into(other_bucket)
    pour_amount = [@level, other_bucket.room].min
    @level -= pour_amount
    other_bucket.level += pour_amount
  end
end

class TwoBucket
  attr_reader :moves, :goal_bucket, :other_bucket

  def initialize(bucket1, bucket2, goal, start_bucket)
    start = start_bucket == 'one' ? Bucket.new('one', bucket1) : Bucket.new('two', bucket2)
    other = start_bucket == 'one' ? Bucket.new('two', bucket2) : Bucket.new('one', bucket1)
    @moves = 0

    if other.size == goal
      @goal_bucket = other.name
      @other_bucket = start.size
      @moves = start_bucket == 'one' ? 2 : 1
      return
    end

    until [start.level, other.level].include?(goal)
      if start.empty?
        start.fill
      elsif other.full?
        other.empty
      else
        start.pour_into(other)
      end
      @moves += 1
    end

    if start.level == goal
      @goal_bucket = start.name
      @other_bucket = other.level
    else
      @goal_bucket = other.name
      @other_bucket = start.level
    end
  end
end
