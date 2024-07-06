# Write your code for the 'Raindrops' exercise in this file. Make the tests in
# `raindrops_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/raindrops` directory.

module Raindrops
  def self.convert(num)
    result = ''

    result.concat('Pling') if num % 3 == 0
    result.concat('Plang') if num % 5 == 0
    result.concat('Plong') if num % 7 == 0

    result.empty? ? num.to_s : result
  end
end
