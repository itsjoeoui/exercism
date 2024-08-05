class Grep
  attr_reader :pattern, :flags, :files

  def initialize(pattern, flags, files)
    @pattern = pattern
    @flags = flags
    @files = files
  end

  def self.grep(pattern, flag, files)
    new(pattern, flag, files).grep
  end

  def grep
    files.map do |file|
      result = grep_file(file)

      if result.empty?
        nil
      elsif filenames?
        file
      elsif multiple_files?
        result.map { |line| "#{file}:#{line}" }.join("\n")
      else
        result.join("\n")
      end
    end.compact.join("\n").strip
  end

  private

  def grep_file(file)
    content = read_file(file)

    content.split("\n").map.with_index do |line, idx|
      has_match = if case_insensitive?
                    line.downcase.include?(pattern.downcase)
                  elsif match_line?
                    line == pattern
                  else
                    line.include?(pattern)
                  end

      has_match = !has_match if inverted_match?

      if has_match
        if line_numbers?
          "#{idx + 1}:#{line}"
        else
          line
        end
      end
    end.compact
  end

  def case_insensitive?
    flags.include?('-i')
  end

  def match_line?
    flags.include?('-x')
  end

  def inverted_match?
    flags.include?('-v')
  end

  def line_numbers?
    flags.include?('-n')
  end

  def multiple_files?
    files.size > 1
  end

  def filenames?
    flags.include?('-l')
  end

  def read_file(file)
    File.open(file, 'r').read
  end
end
