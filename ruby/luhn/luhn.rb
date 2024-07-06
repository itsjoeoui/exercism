# Write your code for the 'Luhn' exercise in this file. Make the tests in
# `luhn_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/luhn` directory.

module Luhn
  def self.valid?(input)
    (input.gsub(/\s/, '').tap { |s| return false unless s[/\A\d+\z/] }
         .chars.map.with_index { |d, i| i.even? ? d.to_i * 2 : d.to_i }
         .map { |d| d > 9 ? d - 9 : d }
         .sum % 10).zero?
  end
end
