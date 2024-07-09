class Grid
  def self.saddle_points(input)
    arr = []
    columns = input.transpose

    input.each_with_index do |row, row_idx|
      row.each_with_index do |_cell, column_idx|
        arr << { 'row' => row_idx + 1, 'column' => column_idx + 1 } if columns[column_idx].min == row.max
      end
    end

    arr
  end
end
