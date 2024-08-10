class School
  def initialize
    @roster = Hash.new { |roster, grade| roster[grade] = Set.new }
  end

  def add(student, grade)
    @roster.each_value do |students|
      return false if students.include?(student)
    end

    @roster[grade].add(student)
    true
  end

  def grade(grade)
    @roster[grade].to_a.sort
  end

  def roster
    @roster.sort.to_h.each do |grade, students|
      @roster[grade] = students.to_a.sort
    end.values.map(&:sort).flatten
  end
end
