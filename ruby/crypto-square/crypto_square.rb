class Crypto
  def initialize(plaintext)
    @plaintext = plaintext
  end

  def ciphertext
    normalize_plaintext

    return '' if @plaintext.empty?

    encode_plaintext
  end

  def normalize_plaintext
    @plaintext = @plaintext.downcase.gsub(/[^a-z0-9]/, '')
  end

  def encode_plaintext
    cols = Math.sqrt(@plaintext.size).ceil

    @plaintext.chars.each_slice(cols).map do |slice|
      slice.join.ljust(cols)
    end.map(&:chars).transpose.map(&:join).join(' ')
  end
end
