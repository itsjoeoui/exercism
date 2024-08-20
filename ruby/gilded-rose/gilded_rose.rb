class Item < Struct.new(:name, :sell_in, :quality)
  def update!
    return if legendary? && !conjured?

    self.sell_in -= 1
    update_quality unless legendary?
    self.quality = quality.clamp(0, 50) unless legendary?
    self.quality = 0 if conjured? && sell_in.negative?
  end

  private

  def update_quality
    case name
    when /Aged Brie/i
      self.quality += sell_in.negative? ? 2 : 1
    when /Backstage passes/i
      self.quality = 0 and return if sell_in.negative?

      self.quality += case sell_in
                      when (...5) then 3
                      when (...10) then 2
                      else 1
                      end
      self.quality -= 1 if conjured?
    else
      delta = sell_in.negative? ? -2 : -1
      delta *= 2 if conjured?
      self.quality += delta
    end
  end

  def legendary?
    name =~ /Sulfuras/
  end

  def conjured?
    name =~ /Conjured/
  end
end

class GildedRose < Struct.new(:items)
  def update!
    items.each(&:update!)
  end
end
