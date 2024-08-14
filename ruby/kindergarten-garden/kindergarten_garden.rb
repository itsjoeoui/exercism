class Garden
  CHILDREN = %w[
    Alice Bob Charlie David
    Eve Fred Ginny Harriet
    Ileana Joseph Kincaid Larry
  ].map(&:downcase).freeze

  SEEDS = %i[clover grass radishes violets]
          .map { |seed| [seed.to_s[0].upcase, seed] }
          .to_h
          .freeze

  def initialize(rows)
    cups = rows.lines.map { |row| row.scan(/../) }.transpose

    CHILDREN.each.with_index do |child, index|
      seeds = Array(cups[index]).join.chars.map(&SEEDS)

      define_singleton_method(child) { seeds }
    end
  end
end
