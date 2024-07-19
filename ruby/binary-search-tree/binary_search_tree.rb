class Bst
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def insert(value)
    {
      -1 => ->(v) { insert_left(v) },
      0 => ->(v) { insert_left(v) },
      1 => ->(v) { insert_right(v) }
    }[value <=> data].call(value)
  end

  def each(&block)
    return to_enum unless block_given?

    left&.each(&block)
    yield data
    right&.each(&block)
  end

  private

  def insert_left(value)
    left ? left.insert(value) : @left = Bst.new(value)
  end

  def insert_right(value)
    right ? right.insert(value) : @right = Bst.new(value)
  end
end
