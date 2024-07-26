class WordProblem
  def initialize(problem)
    @problem = problem.gsub('What is ', '').gsub('?', '').gsub('by ', '').split(' ')
  end

  OPERATIONS = { 'plus' => :+, 'minus' => :-, 'multiplied' => :*, 'divided' => :/ }.freeze
  private_constant :OPERATIONS

  def answer
    @problem.each_with_object({ operation: '+', value: 0 }) do |el, obj|
      if el =~ /\d+/
        obj[:value] = obj[:value].send(obj[:operation], el.to_i)
      elsif OPERATIONS.keys.include?(el)
        obj[:operation] = OPERATIONS[el]
      else
        raise ArgumentError
      end
    end[:value]
  end
end
