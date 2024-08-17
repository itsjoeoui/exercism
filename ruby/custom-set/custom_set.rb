class CustomSet
  include Enumerable
  attr_reader :elements

  def initialize(elements)
    @elements = Hash[elements.map { |el| [el, true] }]
  end

  def each(&block)
    if block_given?
      @elements.keys.each(&block)
    else
      @elements.keys
    end
  end

  def add(element)
    @elements[element] = true
    self
  end

  def union(other)
    CustomSet.new(@elements.keys + other.elements.keys)
  end

  def intersection(other)
    CustomSet.new(@elements.keys & other.elements.keys)
  end

  def difference(other)
    CustomSet.new(@elements.keys - other.elements.keys)
  end

  def member?(element)
    elements.key?(element)
  end

  def subset?(other)
    all? { |el| other.member?(el) }
  end

  def ==(other)
    @elements == other.elements
  end

  def disjoint?(other)
    all? { |el| !other.member?(el) }
  end

  def empty?
    elements.empty?
  end
end
