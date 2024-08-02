class Say
  NUMBER_TO_ENGLISH = {
    0 => 'zero',
    1 => 'one',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine',
    10 => 'ten',
    11 => 'eleven',
    12 => 'twelve',
    13 => 'thirteen',
    14 => 'fourteen',
    15 => 'fifteen',
    16 => 'sixteen',
    17 => 'seventeen',
    18 => 'eighteen',
    19 => 'nineteen',
    20 => 'twenty',
    30 => 'thirty',
    40 => 'forty',
    50 => 'fifty',
    60 => 'sixty',
    70 => 'seventy',
    80 => 'eighty',
    90 => 'ninety'
  }.freeze

  INDEX_TO_ENGLISH = {
    0 => '',
    1 => ' thousand',
    2 => ' million',
    3 => ' billion'
  }.freeze

  attr_reader :number, :is_negative

  def initialize(number)
    raise ArgumentError, 'Number must be between 0 and 999,999,999,999.' if number < 0 || number >= 1_000_000_000_000

    @number = number.to_s.reverse.scan(/\d{1,3}/).map(&:reverse).reverse
  end

  def in_english
    @number.map.with_index do |segment, index|
      if segment.to_i.zero? && !index.zero?
        ''
      else
        segment
      end
    end.reverse.map.with_index do |segment, index|
      if segment == ''
        nil
      else
        segment(segment, index)
      end
    end.compact.reverse.join(' ')
  end

  def segment(number, index)
    number_to_english(number.to_i) + INDEX_TO_ENGLISH[index]
  end

  def number_to_english(number)
    return NUMBER_TO_ENGLISH[number] if NUMBER_TO_ENGLISH.key?(number)

    hundreds, tens = number.divmod(100)
    tens, ones = tens.divmod(10)

    output = []

    # handle hundreds
    output << (NUMBER_TO_ENGLISH[hundreds] + ' hundred') if hundreds > 0

    # handle tens and ones
    tens_ones = tens * 10 + ones
    return output.join(' ') if tens_ones.zero?

    output << if NUMBER_TO_ENGLISH.key?(tens_ones)
                NUMBER_TO_ENGLISH[tens_ones]
              else
                "#{NUMBER_TO_ENGLISH[tens * 10]}-#{NUMBER_TO_ENGLISH[ones]}"
              end
    output.join(' ')
  end
end
