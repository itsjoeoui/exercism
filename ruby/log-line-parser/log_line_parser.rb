class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    @line.strip().split().drop(1).join(" ")
  end

  def log_level
    @line.strip().split()[0][1..-3].downcase
  end

  def reformat
    "#{message()} (#{log_level()})"
  end
end
