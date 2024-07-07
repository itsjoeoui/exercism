# Write your code for the 'Run Length Encoding' exercise in this file. Make the tests in
# `run_length_encoding_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/run-length-encoding` directory.

module RunLengthEncoding
  def self.encode(text)
    text.chars.chunk(&:itself).each_with_object('') do |(letter, count), o|
      o << (count.size > 1 ? count.size.to_s : '') + letter
    end
  end

  def self.decode(text)
    text.scan(/(\d+)?(\D)/).each_with_object('') do |(count, letter), o|
      o << (count ? letter * count.to_i : letter)
    end
  end
end
