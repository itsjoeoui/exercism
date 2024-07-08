# Write your code for the 'ISBN Verifier' exercise in this file. Make the tests in
# `isbn_verifier_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/isbn-verifier` directory.

module IsbnVerifier
  def self.valid?(isbn)
    isbn = isbn.delete('-')[/^\d{9}[0-9X]$/]

    return false unless isbn

    isbn.chars.each_with_index.reduce(0) do |acc, (char, i)|
      char = '10' if char == 'X'
      acc + char.to_i * (10 - i)
    end.modulo(11).zero?
  end
end
