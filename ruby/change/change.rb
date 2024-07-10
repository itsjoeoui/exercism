class Change
  class ImpossibleCombinationError < StandardError; end

  class NegativeTargetError < StandardError; end

  def self.generate(coins, target)
    raise NegativeTargetError, 'Negative target' if target.negative?

    new(coins, target).generate([], target, 0).sort
  end

  def initialize(coins, target)
    @coins = coins.sort.reverse
    @target = target
    @cache = LRUCache.new(100)
  end
  attr_reader :coins, :target

  def generate(result = [], missing, idx)
    return result if missing.zero?

    if (cached = @cache.get([missing, idx]))
      return cached
    end

    idx += 1 while idx < coins.size && coins[idx] > missing

    raise ImpossibleCombinationError if idx >= coins.size

    ans = nil
    (idx...coins.size).each do |i|
      coin = coins[i]

      begin
        if ans.nil?
          ans = generate(result + [coin], missing - coin, i)
        else
          temp = generate(result + [coin], missing - coin, i)
          ans = temp if temp.size < ans.size
        end
      rescue ImpossibleCombinationError
      end
    end

    raise ImpossibleCombinationError if ans.nil?

    @cache.put([missing, idx], ans)
    ans
  end
end

class LRUCache
  Node = Struct.new(:key, :value, :prev, :next)

  def initialize(capacity)
    @capacity = capacity
    @cache = {}
    @head = Node.new(nil, nil)
    @tail = Node.new(nil, nil)
    @head.next = @tail
    @tail.prev = @head
  end

  def get(key)
    node = @cache[key]
    if node
      move_to_head(node)
      return node.value
    end
    nil
  end

  def put(key, value)
    node = @cache[key]
    if node
      node.value = value
      move_to_head(node)
    else
      new_node = Node.new(key, value)
      @cache[key] = new_node
      add_node(new_node)
      if @cache.size > @capacity
        tail = pop_tail
        @cache.delete(tail.key)
      end
    end
  end

  private

  def add_node(node)
    node.prev = @head
    node.next = @head.next
    @head.next.prev = node
    @head.next = node
  end

  def remove_node(node)
    prev_node = node.prev
    next_node = node.next
    prev_node.next = next_node
    next_node.prev = prev_node
  end

  def move_to_head(node)
    remove_node(node)
    add_node(node)
  end

  def pop_tail
    res = @tail.prev
    remove_node(res)
    res
  end
end
