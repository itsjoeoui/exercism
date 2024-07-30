module Atbash
  ALPHABET = ('a'..'z').to_a.freeze
  REVERSE_ALPHABET = ALPHABET.reverse.freeze

  MAPPING = ALPHABET.zip(REVERSE_ALPHABET).to_h

  private_constant :ALPHABET, :REVERSE_ALPHABET, :MAPPING

  def self.encode(plaintext)
    plaintext.downcase
             # .gsub(/[^a-z0-9]/, '')
             # .chars
             .scan(/\w/)
             .each_slice(5)
             .map do |chars|
      chars
        .map(&method(:convert))
        .join
    end
      .join(' ')
  end

  def self.decode(ciphertext)
    ciphertext
      .downcase
      # .gsub(/[^a-z0-9]/, '')
      # .chars
      .scan(/\w/)
      .map(&method(:convert))
      .join
  end

  def self.convert(char)
    if char =~ /\d/
      char
    else
      MAPPING[char]
    end
  end
end
