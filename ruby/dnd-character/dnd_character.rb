# Write your code for the 'D&D Character' exercise in this file. Make the tests in
# `dnd_character_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/dnd-character` directory.

class DndCharacter
  ATTRIBUTES = %w[strength dexterity constitution intelligence wisdom charisma]
  private_constant :ATTRIBUTES

  def self.modifier(num)
    ((num - 10) / 2).floor
  end

  def initialize
    ATTRIBUTES.each do |attr|
      value = 4.times.map { rand(1..6).ceil }.sort.drop(1).sum
      define_singleton_method(attr) { value }
    end
  end

  def hitpoints
    10 + self.class.modifier(constitution)
  end
end
