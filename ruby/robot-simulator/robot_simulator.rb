class Robot
  DIRECTION_VECTORS =
    { north: [0, 1], east: [1, 0], south: [0, -1], west: [-1, 0] }.freeze
  DIRECTIONS = DIRECTION_VECTORS.keys.freeze

  attr_accessor :coordinates, :bearing

  def initialize; end

  def orient(direction)
    raise ArgumentError unless DIRECTIONS.include?(direction)

    @bearing = direction
  end

  def at(x, y)
    @coordinates = [x, y]
  end

  def turn_left
    turn(-1)
  end

  def turn_right
    turn(1)
  end

  def advance
    dx, dy = DIRECTION_VECTORS[@bearing]
    @coordinates[0] += dx
    @coordinates[1] += dy
  end

  private

  def turn(direction)
    @bearing = DIRECTIONS[(DIRECTIONS.index(@bearing) + direction) % 4]
  end
end

class Simulator
  INSTRUCTIONS = { 'L' => :turn_left, 'R' => :turn_right, 'A' => :advance }
  def initialize; end

  def instructions(ins)
    ins.chars.map { |instruction| INSTRUCTIONS[instruction] }
  end

  def place(robot, x:, y:, direction:)
    robot.coordinates = [x, y]
    robot.bearing = direction
  end

  def evaluate(robot, ins)
    instructions(ins).each { |instruction| robot.send(instruction) }
  end
end
