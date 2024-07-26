module RomanNumerals
  KEY = {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }.freeze

  private_constant :KEY

  def to_roman
    value = self

    ''.tap do |roman|
      KEY.each do |n, numeral|
        next unless value >= n

        count = value / n
        value -= (n * count)

        roman << numeral * count
      end
    end
  end
end

Integer.include(RomanNumerals)
