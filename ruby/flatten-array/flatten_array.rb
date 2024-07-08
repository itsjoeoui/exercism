# Write your code for the 'Flatten Array' exercise in this file. Make the tests in
# `flatten_array_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/flatten-array` directory.

module FlattenArray
  def self.flatten(array)
    array.flatten.compact
  end
end
