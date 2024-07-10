# Write your code for the 'List Ops' exercise in this file. Make the tests in
# `list_ops_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/list-ops` directory.

module ListOps
  def self.arrays(array)
    array.size
  end

  def self.reverser(array)
    array.reverse
  end

  def self.concatter(array1, array2)
    array1 + array2
  end

  def self.mapper(array, &block)
    return array if block.nil?

    array.map(&block)
  end

  def self.sum_reducer(array)
    array.reduce(0, :+)
  end

  def self.factorial_reducer(array)
    array.reduce(1, :*)
  end

  def self.filterer(array, &block)
    return array if block.nil?

    array.select(&block)
  end
end
