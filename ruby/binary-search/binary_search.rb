class BinarySearch
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def search_for(item)
    lp = 0
    rp = array.length - 1

    while lp <= rp
      mp = lp + (rp - lp) / 2

      if array[mp] == item
        return mp
      elsif array[mp] < item
        lp = mp + 1
      else
        rp = mp - 1
      end

    end
  end
end
