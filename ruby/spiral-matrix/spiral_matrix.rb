class Matrix
  attr_reader :matrix, :size

  def initialize(size)
    @size = size
    @matrix = Array.new(size) { Array.new(size) { :empty } }
  end

  def fill_position(coordinate, value)
    matrix[coordinate.y][coordinate.x] = value
  end

  def empty?(coordinate)
    get(coordinate) == :empty
  end

  def to_a
    @matrix
  end

  private

  def get(coordinate)
    matrix[coordinate.y]&.fetch(coordinate.x, nil)
  end
end

class Coordinate < Struct.new(:x, :y)
  def move(direction)
    case direction

    when :right then Coordinate.new(x + 1, y)
    when :down then Coordinate.new(x, y + 1)
    when :left then Coordinate.new(x - 1, y)
    when :up then Coordinate.new(x, y - 1)

    end
  end
end

class SpiralMatrix
  attr_reader :grid, :direction, :level, :coordinate

  def initialize(level)
    @direction = %i[right down left up]
    @grid = Matrix.new(level)
    @coordinate = Coordinate.new(0, 0)
    @level = level
  end

  def matrix
    (1..(level * level)).each do |val|
      grid.fill_position(coordinate, val)

      change_direction_if_needed
      walk
    end

    @grid.to_a
  end

  private

  def change_direction_if_needed
    direction.rotate! unless grid.empty?(coordinate.move(direction.first))
  end

  def walk
    @coordinate = coordinate.move(direction.first)
  end
end
