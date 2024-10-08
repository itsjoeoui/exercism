class Affine < Struct.new(:a, :b)
  ALPHABET = ('a'..'z').to_a.join

  def initialize(a, b)
    raise ArgumentError unless a.gcd(26) == 1

    super
  end

  def encode(plaintext)
    plaintext.downcase.gsub(/\W/, '').tr(ALPHABET, cipher).chars
             .each_slice(5).map(&:join).join(' ')
  end

  def decode(ciphertext)
    ciphertext.gsub(/\W/, '').tr(cipher, ALPHABET).chars.join
  end

  private

  def cipher
    ALPHABET.chars.map(&method(:encode_char)).join
  end

  def encode_char(c)
    ALPHABET[(a * ALPHABET.index(c) + b) % ALPHABET.length]
  end
end
