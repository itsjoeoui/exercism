module Brackets
  BRACKETS = { '[' => ']', '{' => '}', '(' => ')' }.freeze

  private_constant :BRACKETS

  def self.paired?(input)
    stack = []

    input.chars.each do |char|
      if BRACKETS.keys.include?(char)
        stack.push(char)
      elsif BRACKETS.values.include?(char)
        return false if stack.empty?

        top = stack.pop

        return false if BRACKETS[top] != char
      end
    end

    stack.empty?
  end
end
