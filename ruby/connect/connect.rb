class Board
  attr_reader :board

  def initialize(board)
    @board = board.map { |row| row.gsub(/\s/, '') }
  end

  def winner
    %w[X O].each do |player|
      sps = start_points(player)
      next if sps.empty?

      queue = sps
      reachable = sps.dup

      until queue.empty?
        x, y = queue.shift
        return player if win?(player, x, y)

        get_neighbors(x, y).each do |nx, ny|
          next if @board[ny][nx] != player
          next if reachable.include?([nx, ny])

          queue << [nx, ny]
          reachable << [nx, ny]
        end
      end
    end

    ''
  end

  private

  def get_neighbors(x, y)
    DIRS.map do |dx, dy|
      [x + dx, y + dy]
    end.select do |nx, ny|
      nx >= 0 && nx < board[0].size && ny >= 0 && ny < board.size
    end
  end

  def win?(player, x, y)
    case player
    when 'X'
      x == board[0].size - 1
    when 'O'
      y == board.size - 1
    end
  end

  def start_points(player)
    case player
    when 'X'
      (0...board.size).map { |y| [0, y] }
                      .select { |x, y| @board[y][x] == 'X' }
    when 'O'
      (0...board[0].size).map { |x| [x, 0] }
                         .select { |x, y| @board[y][x] == 'O' }
    end
  end

  DIRS = [
    [0, 1], # right
    [1, 0], # down right
    [1, -1], # down left
    [0, -1], # left
    [-1, 0], # top left
    [-1, 1] # top right
  ].freeze

  private_constant :DIRS
end
