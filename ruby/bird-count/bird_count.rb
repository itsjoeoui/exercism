class BirdCount
  def self.last_week
    [0, 2, 5, 3, 7, 8, 4]
  end

  def initialize(_birds_per_day)
    @lw = _birds_per_day
  end

  def yesterday
    @lw[-2]
  end

  def total
    @lw.sum
  end

  def busy_days
    @lw.count { |bird| bird > 4 }
  end

  def day_without_birds?
    @lw.any? { |bird| bird == 0 }
  end
end
