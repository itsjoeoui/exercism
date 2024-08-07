class SecretHandshake
  COMMANDS = ['wink', 'double blink', 'close your eyes', 'jump'].freeze
  private_constant :COMMANDS

  def initialize(number)
    @number = number.to_i
  end

  def commands
    result = COMMANDS.select.with_index do |move, index|
      move if number[index] == 1
    end

    number[4].zero? ? result : result.reverse
  end

  private

  attr_reader :number
end
