# Write your code for the 'Bob' exercise in this file. Make the tests in
# `bob_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/bob` directory.

module Bob
  def self.hey(sentence)
    sentence = sentence.strip

    if sentence.empty?
      'Fine. Be that way!'
    elsif yelling?(sentence) && question?(sentence)
      "Calm down, I know what I'm doing!"
    elsif yelling?(sentence)
      'Whoa, chill out!'
    elsif question?(sentence)
      'Sure.'
    else
      'Whatever.'
    end
  end

  def self.yelling?(remark)
    remark.match?(/[A-Z]/) && remark.upcase == remark
  end

  def self.question?(remark)
    remark[-1] == '?'
  end
end
