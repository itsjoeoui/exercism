module PrimeFactors
  def self.of(number)
    factors = []

    # for candidate in 2..(number / 2 + 2)
    #   while (number % candidate).zero?
    #     factors << candidate
    #     number /= candidate
    #   end
    #   break if number == 1
    # end

    factor = 2
    while number > 1
      factor += factor == 2 ? 1 : 2 while number % factor != 0
      number /= factor
      factors << factor
    end

    factors
  end
end
