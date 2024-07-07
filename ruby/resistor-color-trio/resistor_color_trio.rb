# Write your code for the 'Resistor Color Trio' exercise in this file. Make the tests in
# `resistor_color_trio_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/resistor-color-trio` directory.

class BandError < ArgumentError
  def initialize(message = 'Invalid band')
    super
  end
end

class ResistorColorTrio
  BANDS = {
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }.freeze
  private_constant :BANDS

  attr_reader :value

  def initialize(bands)
    bands = bands.map(&:to_sym).map(&BANDS)
    validate(bands)
    @value = Integer(format('%s%s', bands.take(2).join, '0' * bands.last))
  end

  def validate(bands)
    bands.any?(&:nil?) and raise BandError
  end

  def measurement
    value >= 1000 and [value / 1000, 'kiloohms'] or [value, 'ohms']
  end

  def label
    'Resistor value: %i %s' % measurement
  end
end
