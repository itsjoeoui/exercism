class Node
  attr_accessor :value, :left, :right

  def initialize(value, left, right)
    @value = value
    @left = left
    @right = right
  end

  def ==(other)
    value == other.value &&
      left == other.left &&
      right == other.right
  end
end

class Zipper
  attr_reader :tree, :pointers

  def initialize(tree)
    @tree = tree
    @pointers = []
  end

  def self.from_tree(tree)
    Zipper.new(tree)
  end

  def to_tree
    @pointers.clear
    tree
  end

  def left
    pointers << :left
    self if position
  end

  def right
    pointers << :right
    self if position
  end

  def position
    pointers.inject(tree) do |node, pointer|
      node.send(pointer)
    end
  end

  def value
    position.value
  end

  def up
    return nil if pointers.empty?

    pointers.pop
    self
  end

  def set_value(value)
    position.value = value
    self
  end

  def set_left(node)
    position.left = node
    self
  end

  def set_right(node)
    position.right = node
    self
  end

  def ==(other)
    tree == other.tree &&
      pointers == other.pointers
  end
end
