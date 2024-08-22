class ZebraPuzzle
  @nationalities = %w[English Spaniard Norwegian Japanese Ukranian]
  @colors = %w[Red Green Ivory Blue Yellow]
  @pets = %w[Dog Fox Snails Horse Zebra]
  @drinks = ['Coffee', 'Tea', 'Milk', 'Water', 'Orange Juice']
  @smokes = ['Old Gold', 'Kool', 'Chesterfield', 'Lucky Strike', 'Parliament']

  @@solution = nil

  def self.solve
    @nationalities.permutation.each do |n|
      # 10. The Norwegian lives in the first house.
      next if n.index('Norwegian') != 0

      @colors.permutation.each do |c|
        # 2. The Englishman lives in the red house.
        next if n.index('English') != c.index('Red')
        # 6. The green house is immediately to the right of the ivory house.
        next if c.index('Ivory') != c.index('Green') + 1
        # 15. The Norwegian lives next to the blue house.
        next unless [-1, 1].include?(c.index('Blue') - n.index('Norwegian'))

        @pets.permutation.each do |p|
          # 3. The Spaniard owns the dog.
          next if n.index('Spaniard') != p.index('Dog')

          @drinks.permutation.each do |d|
            # 4. Coffee is drunk in the green house.
            next if d.index('Coffee') != c.index('Green')
            # 5. The Ukrainian drinks tea.
            next if d.index('Tea') != n.index('Ukranian')
            # 9. Milk is drunk in the middle house.
            next if d.index('Milk') != 2

            @smokes.permutation.each do |s|
              # 7. The Old Gold smoker owns snails.
              next if s.index('Old Gold') != p.index('Snails')
              # 8. Kools are smoked in the yellow house.
              next if s.index('Kool') != c.index('Yellow')
              # 11. The man who smokes Chesterfields lives in the
              # house next to the man with the fox.
              next unless [-1, 1].include?(s.index('Chesterfield') - p.index('Fox'))
              # 12. Kools are smoked in the house next to the house
              # where the horse is kept.
              next unless [-1, 1].include?(s.index('Kool') - p.index('Horse'))

              # 13. The Lucky Strike smoker drinks orange juice.
              next if s.index('Lucky Strike') != d.index('Orange Juice')
              # 14. The Japanese smokes Parliaments.
              next if s.index('Parliament') != n.index('Japanese')

              return [n, c, p, d, s]
            end
          end
        end
      end
    end
  end

  def self.water_drinker
    @@solution ||= solve
    n, c, p, d, s = @@solution
    n[d.index('Water')]
  end

  def self.zebra_owner
    @@solution ||= solve
    n, c, p, d, s = @@solution
    n[p.index('Zebra')]
  end
end
