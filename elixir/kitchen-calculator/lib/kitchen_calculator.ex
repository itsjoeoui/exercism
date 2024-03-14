defmodule KitchenCalculator do
  def get_volume({_, vol} = _volume_pair) do
    vol
  end

  def to_milliliter({:cup, vol} = _volume_pair), do: {:milliliter, vol * 240}
  def to_milliliter({:fluid_ounce, vol} = _volume_pair), do: {:milliliter, vol * 30}
  def to_milliliter({:teaspoon, vol} = _volume_pair), do: {:milliliter, vol * 5}
  def to_milliliter({:tablespoon, vol} = _volume_pair), do: {:milliliter, vol * 15}
  def to_milliliter({:milliliter, vol} = _volume_pair), do: {:milliliter, vol}

  # def from_milliliter({:milliliter, amt} = _volume_pair, :cup = _unit), do: {:cup, amt / 240}
  #
  # def from_milliliter({:milliliter, amt} = _volume_pair, :fluid_ounce = _unit),
  #   do: {:fluid_ounce, amt / 30}
  #
  # def from_milliliter({:milliliter, amt} = _volume_pair, :teaspoon = _unit),
  #   do: {:teaspoon, amt / 5}
  #
  # def from_milliliter({:milliliter, amt} = _volume_pair, :tablespoon = _unit),
  #   do: {:tablespoon, amt / 15}
  #
  # def from_milliliter({:milliliter, amt} = _volume_pair, :milliliter = _unit),
  #   do: {:milliliter, amt}
  def from_milliliter({:milliliter, amt} = _volume_pair, unit) do
    {unit, amt / (to_milliliter({unit, 1}) |> get_volume)}
  end

  def convert(volume_pair, unit) do
    volume_pair |> to_milliliter() |> from_milliliter(unit)
  end
end
