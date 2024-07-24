class PerfectNumber
  attr_reader :number

  CLASSIFICATIONS = {
    -1 => 'deficient',
    0 => 'perfect',
    1 => 'abundant'
  }.freeze

  def self.classify(number)
    raise RuntimeError if number.negative?

    CLASSIFICATIONS[aliquot_sum(number) <=> number]
  end

  def self.aliquot_sum(number)
    (1..(number / 2)).select { |i| (number % i).zero? }.sum
  end
end
