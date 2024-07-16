# Write your code for the 'Simple Linked List' exercise in this file. Make the tests in
# `simple_linked_list_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/simple-linked-list` directory.

class Element
  attr_reader :datum

  attr_accessor :next

  def initialize(datum)
    @datum = datum
    @next = nil
  end

  def to_a
    [datum]
  end
end

class SimpleLinkedList
  attr_reader :head

  def initialize(arr = [])
    @head = Element.new(nil)

    return unless arr

    arr.each { |datum| push(Element.new(datum)) }
  end

  def push(element)
    element.next = @head.next
    @head.next = element
    self
  end

  def pop
    node = @head.next
    return nil unless node

    @head.next = node.next

    node
  end

  def reverse!
    return self if @head.next.nil?

    prev = nil
    cur = @head.next
    nxt = cur.next
    while nxt
      cur.next = prev
      prev = cur
      cur = nxt
      nxt = cur.next
    end
    cur.next = prev
    @head.next = cur
    self
  end

  def to_a
    result = []
    cur = head

    while cur.next
      cur = cur.next
      result << cur.datum
    end

    result
  end
end
