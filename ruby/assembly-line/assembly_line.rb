class AssemblyLine
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    @speed * 221 * success_ratio
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end

  def success_ratio
    case @speed
    when 1..4 then 1.0
    when 5..8 then 0.9
    when 9 then 0.8
    when 10 then 0.77
    else 0.0
    end
  end
end
