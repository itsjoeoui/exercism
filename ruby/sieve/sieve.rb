# Write your code for the 'Sieve' exercise in this file. Make the tests in
# `sieve_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/sieve` directory.

class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    return [] if @limit < 2

    primes = (2..@limit).to_a
    primes.each do |num|
      primes.reject! { |n| (n % num).zero? && n != num }
    end
    primes
  end
end
