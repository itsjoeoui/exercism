class Minesweeper
  def initialize(input)
    @board = input.map(&:chars)
    @num_rows = @board.size
    @num_columns = @board.first.size
  end

  def self.annotate(input)
    return [] unless input.any?

    new(input).annotate
  end

  def annotate
    @board.each_with_index do |row, row_idx|
      row.each_with_index do |cell, column_idx|
        increment_cells(row_idx, column_idx) if cell == '*'
      end
    end.map(&:join)
  end

  private

  attr_reader :board, :num_rows, :num_columns

  def increment_cells(row_idx, column_idx)
    [-1, 0, 1].each do |row_offset|
      [-1, 0, 1].each do |col_offset|
        increment_cell(row_idx + row_offset, column_idx + col_offset)
      end
    end
  end

  def increment_cell(row_idx, column_idx)
    return if row_idx.negative? || row_idx >= num_rows
    return if column_idx.negative? || column_idx >= num_columns

    value = board[row_idx][column_idx]
    return if value == '*'

    board[row_idx][column_idx] =
      if value == ' '
        '1'
      else
        (value.to_i + 1).to_s
      end
  end
end
