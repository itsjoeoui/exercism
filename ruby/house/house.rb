# frozen_string_literal: true

class House
  VERSES = [
    ['This is', 'the horse and the hound and the horn'],
    ['that belonged to', 'the farmer sowing his corn'],
    ['that kept', 'the rooster that crowed in the morn'],
    ['that woke', 'the priest all shaven and shorn'],
    ['that married', 'the man all tattered and torn'],
    ['that kissed', 'the maiden all forlorn'],
    ['that milked', 'the cow with the crumpled horn'],
    ['that tossed', 'the dog'],
    ['that worried', 'the cat'],
    ['that killed', 'the rat'],
    ['that ate', 'the malt'],
    ['that lay in', 'the house that Jack built.']
  ].reverse.freeze

  def self.recite
    new.complete_poem
  end

  def complete_poem
    (1..VERSES.size).map do |line|
      complete_stanza(line)
    end.join("\n")
  end

  def complete_stanza(total)
    total.downto(1).map { |line| complete_line(line, total) }.join("\n").concat("\n")
  end

  def complete_line(line, total)
    action, subject = VERSES[line - 1]
    if line == total
      "This is #{subject}"
    else
      "#{action} #{subject}"
    end
  end
end
