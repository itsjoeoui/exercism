# Write your code for the 'Simple Cipher' exercise in this file. Make the tests in
# `simple_cipher_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/simple-cipher` directory.

ALPHABET = ('a'..'z').to_a

module Key
  def self.valid?(key)
    key.match?(/\A[a-z]+\z/)
  end

  def self.generate
    ALPHABET.sample(100).join('')
  end
end

class Cipher
  attr_reader :key

  def initialize(key = Key.generate)
    raise ArgumentError unless Key.valid?(key)

    @key = key
  end

  def encode(plaintext)
    shift(plaintext, :+)
  end

  def decode(ciphertext)
    shift(ciphertext, :-)
  end

  private

  def shift(str, op)
    str.chars.map.with_index do |char, idx|
      current = ALPHABET.index(char)
      delta = ALPHABET.index(key[idx % key.size])
      new_idx = current.send(op, delta) % ALPHABET.size
      ALPHABET[new_idx]
    end.join
  end
end
