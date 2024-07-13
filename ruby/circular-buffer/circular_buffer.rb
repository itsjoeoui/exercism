# Write your code for the 'Circular Buffer' exercise in this file. Make the tests in
# `circular_buffer_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/circular-buffer` directory.

class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  attr_reader :buffer

  def initialize(size)
    @size = size
    @buffer = []
  end

  def read
    raise BufferEmptyException if buffer.empty?

    buffer.shift
  end

  def write(data)
    return if data.nil?
    raise BufferFullException if full?

    buffer << data
  end

  def write!(data)
    buffer.shift if full?
    buffer << data
  end

  def clear
    buffer.clear
  end

  private

  def full?
    buffer.size == size
  end

  attr_reader :size
end
