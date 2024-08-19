class Knapsack
  def initialize(max_weight)
    @max_weight = max_weight
  end

  attr_reader :max_weight

  def max_value(items)
    return 0 if items.empty?

    matrix = Array.new(items.length + 1) do
      Array.new(max_weight + 1, 0)
    end

    (1..items.length).each do |r|
      (1..max_weight).each do |weight|
        item = items[r]

        matrix[r][weight] = if item.weight < weight
                              matrix[r - 1][weight]
                            else
                              [
                                matrix[r - 1][weight],
                                matrix[r][weight - item.weight] + item.value
                              ].max
                            end
      end
    end

    matrix[items.length][max_weight]
  end
end
