defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when is_integer(input) and input > 0 do
    do_it(input, 0)
  end

  defp do_it(1, steps), do: steps

  defp do_it(input, steps) when rem(input, 2) == 1 do
    do_it(input * 3 + 1, steps + 1)
  end

  defp do_it(input, steps) when rem(input, 2) == 0 do
    do_it(div(input, 2), steps + 1)
  end
end
