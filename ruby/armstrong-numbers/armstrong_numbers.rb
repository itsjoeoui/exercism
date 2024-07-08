module ArmstrongNumbers
  def self.include?(number)
    number_of_digits = number.digits.size

    number == number.digits.sum { |digit| digit**number_of_digits }
  end
end
