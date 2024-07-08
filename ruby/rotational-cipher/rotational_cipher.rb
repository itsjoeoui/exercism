# Write your code for the 'Rotational Cipher' exercise in this file. Make the tests in
# `rotational_cipher_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/rotational-cipher` directory.

module RotationalCipher
  UPPERCASE = ('A'..'Z').to_a.freeze
  LOWERCASE = ('a'..'z').to_a.freeze
  LETTERS = (LOWERCASE + UPPERCASE).join.freeze

  private_constant :LOWERCASE, :UPPERCASE, :LETTERS

  def self.rotate(text, delta)
    text.tr(LETTERS, (LOWERCASE.rotate(delta) + UPPERCASE.rotate(delta)).join)
  end
end
