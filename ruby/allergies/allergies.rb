class Allergies
  ALLERGIES = {
    1 => 'eggs',
    2 => 'peanuts',
    4 => 'shellfish',
    8 => 'strawberries',
    16 => 'tomatoes',
    32 => 'chocolate',
    64 => 'pollen',
    128 => 'cats'
  }
  ALLERGIES.default = nil
  ALLERGIES.freeze

  private_constant :ALLERGIES

  attr_reader :allergens

  def initialize(score)
    @allergens = ALLERGIES.select { |flag, _| (flag & score) != 0 }.values
  end

  def list
    @allergens
  end

  def allergic_to?(allergen)
    @allergens.include?(allergen)
  end
end
