# Write your code for the 'Space Age' exercise in this file. Make the tests in
# `space_age_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/space-age` directory.

class SpaceAge
  def initialize(seconds)
    @seconds = seconds
  end

  {
    earth: 1.0,
    mercury: 0.2408467,
    venus: 0.61519726,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  }.each_pair do |planet, ratio|
    define_method("on_#{planet}") do
      @seconds / (EARCH_YEAR_IN_SECONDS * ratio)
    end
  end

  private attr_reader :seconds

  EARCH_YEAR_IN_SECONDS = 31_557_600
  private_constant :EARCH_YEAR_IN_SECONDS
end
