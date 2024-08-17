class Node
  attr_accessor :value, :next_node, :prev_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
    @prev_node = nil
  end
end

class Deque
  attr_accessor :head, :tail

  def initialize
    @head = Node.new
    @tail = Node.new

    @head.next_node = @tail
    @tail.prev_node = @head
  end

  def push(value)
    node = Node.new(value)
    node.prev_node = @tail.prev_node
    node.next_node = @tail
    @tail.prev_node.next_node = node
    @tail.prev_node = node
  end

  def pop
    node = @tail.prev_node
    @tail.prev_node = node.prev_node
    node.prev_node.next_node = @tail

    node.value
  end

  def shift
    node = @head.next_node
    @head.next_node = node.next_node
    node.next_node.prev_node = @head

    node.value
  end

  def unshift(value)
    node = Node.new(value)
    node.next_node = @head.next_node
    node.prev_node = @head
    @head.next_node.prev_node = node
    @head.next_node = node
  end
end
