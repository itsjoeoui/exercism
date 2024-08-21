class Piece
  attr_reader :rank, :file

  def initialize(arr)
    @rank = arr[0]
    @file = arr[1]
    raise ArgumentError if out_of_bound?
  end

  def same_file?(piece)
    file == piece.file
  end

  def same_rank?(piece)
    rank == piece.rank
  end

  def same_diagonal?(piece)
    (rank - piece.rank).abs == (file - piece.file).abs
  end

  def out_of_bound?
    rank < 0 || rank > 7 || file < 0 || file > 7
  end
end

class Queen < Piece
  def can_attack?(piece)
    same_file?(piece) || same_rank?(piece) || same_diagonal?(piece)
  end
end

class Queens
  def initialize(white: nil, black: nil)
    @white = Queen.new(white) if white
    @black = Queen.new(black) if black
  end

  def attack?
    @white.can_attack?(@black)
  end
end
