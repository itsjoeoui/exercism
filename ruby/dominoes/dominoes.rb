module Dominoes
  class AdjacencyMatrix
    attr_accessor :nodes, :edges

    def initialize(edges)
      @nodes = edges.flatten.uniq
      @edges = edges
    end

    def graph
      matrix = Array.new(@nodes.size) { Array.new(@nodes.size, false) }
      @graph ||= edges.map { |e| e.map(&nodes.method(:index)) }.each_with_object(matrix) do |(x, y), m|
        m[x][y] = m[y][x] = true
      end
    end

    def all_connected?
      visited = Array.new(@nodes.size, false)
      stack = [0]
      visited[0] = true

      until stack.empty?
        node = stack.pop
        visited[node] = true
        graph[node].each_with_index do |connected, i|
          next unless connected && !visited[i]

          stack.push(i)
        end
      end

      visited.all?
    end

    def all_even_degress?
      edges.flatten.tally.values.all?(&:even?)
    end
  end

  def self.chain?(dominos)
    return true if dominos.empty?

    am = AdjacencyMatrix.new(dominos)

    am.all_connected? && am.all_even_degress?
  end
end
