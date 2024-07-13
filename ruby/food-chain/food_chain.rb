# Write your code for the 'Food Chain' exercise in this file. Make the tests in
# `food_chain_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/food-chain` directory.

Meal = Struct.new(:name, :desc, :extra) do
  def animal_with_extra
    [name, extra].compact.join(' ')
  end
end

class FoodChain
  attr_reader :meals

  def self.song
    new.song
  end

  def initialize
    @meals = [
      Meal.new('fly', "I don't know why she swallowed the fly. Perhaps she'll die."),
      Meal.new('spider', 'It wriggled and jiggled and tickled inside her.',
               'that wriggled and jiggled and tickled inside her'),
      Meal.new('bird', 'How absurd to swallow a bird!'),
      Meal.new('cat', 'Imagine that, to swallow a cat!'),
      Meal.new('dog', 'What a hog, to swallow a dog!'),
      Meal.new('goat', 'Just opened her throat and swallowed a goat!'),
      Meal.new('cow', "I don't know how she swallowed a cow!"),
      Meal.new('horse', "She's dead, of course!")
    ]
  end

  def song
    meals.map { |meal| VerseBuilder.build(meals, meal) }.join("\n")
  end
end

class VerseBuilder
  INITIAL_LINE = 'I know an old lady who swallowed a %s.'
  CHAIN_LINE = 'She swallowed the %s to catch the %s.'

  attr_reader :meals, :meal

  def self.build(*args)
    new(*args).build
  end

  def initialize(meals, meal)
    @meals = meals
    @meal = meal
  end

  def build
    (initial_lines + chain_lines).join("\n") + "\n"
  end

  def initial_lines
    [
      INITIAL_LINE % meal.name,
      meal.desc
    ]
  end

  def chain_lines
    return [] unless has_chain_lines?

    meals[0..meals.index(meal)].reverse.each_cons(2).map do |meal, reason|
      format(CHAIN_LINE, meal.name, reason.animal_with_extra)
    end + [meals.first.desc]
  end

  def has_chain_lines?
    idx = meals.index(meal)
    idx > 0 && idx < meals.size - 1
  end
end
