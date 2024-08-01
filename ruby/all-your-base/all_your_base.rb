module BaseConverter
  def self.convert(input_base, digits, output_base)
    raise ArgumentError if input_base <= 1 || output_base <= 1

    base10 = input_base != 10 ? convert_to_base10(input_base, digits) : digits.join.to_i

    convert_to_base(base10, output_base)
  end

  def self.convert_to_base10(input_base, digits)
    digits.reverse.each_with_index.reduce(0) do |sum, (digit, index)|
      raise ArgumentError if digit >= input_base || digit.negative?

      digit * input_base**index + sum
    end
  end

  def self.convert_to_base(base10, output_base)
    power = find_largest_power_of_base(output_base, base10)

    output = []

    loop do
      if power <= 0
        output << base10
        break
      end

      digit = base10 / output_base**power
      base10 -= digit * output_base**power
      output << digit
      power -= 1
    end

    output.empty? ? [0] : output
  end

  def self.find_largest_power_of_base(base, number)
    (0..).find { |power| base**power > number } - 1
  end
end
