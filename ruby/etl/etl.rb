# Write your code for the 'ETL' exercise in this file. Make the tests in
# `etl_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/etl` directory.

module ETL
  def self.transform(input)
    input.each_with_object({}) do |(score, letters), result|
      letters.each { |letter| result[letter.downcase] = score }
    end
  end
end
