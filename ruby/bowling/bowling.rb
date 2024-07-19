class Game
  class BowlingError < RuntimeError; end

  attr_accessor :frames

  def initialize
    @frames = []
  end

  def roll(pins)
    validate_roll(pins)

    frames << Frame.new(:open) unless frames.last && frames.last.open?

    frames.last.add_roll(pins)

    record_bonus_points(pins)
  end

  def score
    raise BowlingError unless game_complete?

    frames[0..9].sum(&:score)
  end

  def validate_roll(pins)
    if pins.negative?
      raise BowlingError, 'Even the worst bowler cannot score negative pins :)'
    elsif pins > 10
      raise BowlingError, 'There are only 10 pins, give those back to your neighbor!'
    elsif game_complete?
      raise BowlingError, 'A game is 10 frames. Time to start a new one.'
    end
  end

  def record_bonus_points(pins)
    start = [frames.length - 3, 0].max
    start.upto([start + 1, frames.length - 2].min) { |f| frames[f].add_bonus_points(pins) }
  end

  def game_complete?
    frames.length >= 10 && frames[9].complete?
  end

  class Frame
    attr_accessor :state, :rolls, :bonus_points, :bonus_rolls

    def initialize(state)
      @state = state
      @rolls = []

      @bonus_points = 0
      @bonus_rolls = 0
    end

    def add_bonus_points(pins)
      return unless bonus_roll?

      @bonus_points += pins
      @bonus_rolls -= 1
    end

    def score
      rolls.sum(0) + bonus_points
    end

    def add_roll(pins)
      raise BowlingError if rolls.length.positive? && (rolls.last + pins) > 10

      rolls << pins

      if pins == 10
        strike
      elsif rolls.sum(0) == 10
        spare

      elsif rolls.length == 2
        @state = :closed
      end
    end

    def open?
      state == :open
    end

    def complete?
      !open? && !bonus_roll?
    end

    private

    def strike
      @bonus_rolls = 2
      @state = :strike
    end

    def spare
      @bonus_rolls = 1
      @state = :spare
    end

    def bonus_roll?
      bonus_rolls.positive?
    end
  end
end
