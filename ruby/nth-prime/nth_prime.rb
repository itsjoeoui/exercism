# Write your code for the 'Nth Prime' exercise in this file. Make the tests in
# `nth_prime_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/nth-prime` directory.

module Prime
  def self.nth(n)
    raise ArgumentError if n == 0

    primes = [2, 3]

    i = primes.last + 2
    while primes.length < n

      primes << i if prime?(i, primes)
      i += 2

    end

    primes[n - 1]
  end

  def self.prime?(candidate, primes)
    sqrt = Math.sqrt(candidate)

    primes.all? do |prime|
      return true if prime > sqrt

      candidate % prime != 0
    end
  end
end
