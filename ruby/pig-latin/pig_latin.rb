class PigLatin
  VOWEL_SOUNDS = %w[A E I O U XR YT].freeze
  Y_AFTER_CLUSTER = /^([^aeiouy]+)(y.*)$/.freeze
  BEGINS_CONSONANT = /^([^aeiou]?qu|[^aeiou]+)(.*)$/.freeze
  private_constant :VOWEL_SOUNDS, :Y_AFTER_CLUSTER, :BEGINS_CONSONANT

  def self.translate(phrase)
    new(phrase).translate
  end

  def translate
    @phrase.split(' ').map(&method(:translate_word)).join(' ')
  end

  def initialize(phrase)
    @phrase = phrase
  end

  def begins_with_vowel_sound?(word)
    word = word.upcase
    VOWEL_SOUNDS.any? { |prefix| word.start_with?(prefix) }
  end

  def match_begins_with_consonant_sound(word)
    word.match(BEGINS_CONSONANT)
  end

  def match_y_after_consonant_cluster(word)
    word.match(Y_AFTER_CLUSTER)
  end

  def translate_word(word)
    if begins_with_vowel_sound?(word)
      "#{word}ay"
    elsif (match = match_y_after_consonant_cluster(word))
      "#{match[2]}#{match[1]}ay"
    elsif (match = match_begins_with_consonant_sound(word))
      "#{match[2]}#{match[1]}ay"
    else
      word
    end
  end
end
