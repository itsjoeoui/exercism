module Port
  IDENTIFIER = :PALE

  def self.get_identifier(_city)
    _city.slice(0, 4).upcase.to_sym
  end

  def self.get_terminal(_ship_identifier)
    t = _ship_identifier.to_s.slice(0, 3).upcase

    case t
    when 'OIL', 'GAS' then :A
    else :B
    end
  end
end
