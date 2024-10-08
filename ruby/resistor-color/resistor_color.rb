# Write your code for the 'Resistor Color' exercise in this file. Make the tests in
# `resistor_color_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/resistor-color` directory.

module ResistorColor
  COLORS = %w[black brown red orange yellow green blue violet grey white].freeze

  public_constant :COLORS

  def self.color_code(color)
    COLORS.index(color)
  end
end
