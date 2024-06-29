module Chess
  RANKS = 1..8
  FILES = 'A'..'H'

  def self.valid_square?(_rank, _file)
    RANKS.include?(_rank) && FILES.include?(_file)
  end

  def self.nick_name(_first_name, _last_name)
    _first_name.slice(0, 2).upcase + _last_name[-2..].upcase
  end

  def self.move_message(_first_name, _last_name, _square)
    if valid_square?(_square[1].to_i, _square[0])
      "#{nick_name(_first_name, _last_name)} moved to #{_square}"

    else
      "#{nick_name(_first_name, _last_name)} attempted to move to #{_square}, but that is not a valid square"
    end
  end
end
