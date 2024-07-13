# frozen_string_literal: true

class OcrNumbers
  DIGITS = {
    [' _ ', '| |', '|_|', '   '] => '0',
    ['   ', '  |', '  |', '   '] => '1',
    [' _ ', ' _|', '|_ ', '   '] => '2',
    [' _ ', ' _|', ' _|', '   '] => '3',
    ['   ', '|_|', '  |', '   '] => '4',
    [' _ ', '|_ ', ' _|', '   '] => '5',
    [' _ ', '|_ ', '|_|', '   '] => '6',
    [' _ ', '  |', '  |', '   '] => '7',
    [' _ ', '|_|', '|_|', '   '] => '8',
    [' _ ', '|_|', ' _|', '   '] => '9'
  }
  DIGITS.default = '?'
  DIGITS.freeze

  def self.convert(arg)
    rows = arg.lines chomp: true
    raise ArgumentError, 'Number of lines in string must be multiple of 4' unless (rows.size % 4).zero?
    raise ArgumentError, 'All rows must have equal size' unless rows.all? { |r| r.size == rows.first.size }
    raise ArgumentError, 'Column count for all rows must be multiple of 3' unless rows.all? { |r| (r.size % 3).zero? }

    rows.each_slice(4).map do |line|
      row_representation = split_rows(line)
      single_chars = characters_of(row_representation)
      single_chars.map { |c| DIGITS[c] }.join
    end.join(',')
  end

  def self.characters_of(row_representation)
    row_number = row_representation.first.size
    character_count = row_representation.size
    (0...row_number).map do |char_idx|
      (0...character_count).map { |row_idx| row_representation[row_idx][char_idx] }
    end
  end

  def self.split_rows(rows)
    rows.map { |row| row.chars.each_slice(3).map(&:join) }.to_a
  end
end
