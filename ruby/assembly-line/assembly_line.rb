class AssemblyLine
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    total = @speed * 221

    if @speed <= 4
      total
    elsif @speed <= 8
      total * 0.9
    elsif @speed == 9
      total * 0.8
    else
      total * 0.77
    end
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end
end
