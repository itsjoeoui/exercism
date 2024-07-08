module PhoneNumber
  def self.clean(number)
    number = number.scan(/\d+/).join

    if number.length == 11
      return nil if number[0] != '1'

      number = number[1..]
    end

    return nil unless number.match?(/^[2-9]\d{2}[2-9]\d{6}$/)

    number
  end
end
