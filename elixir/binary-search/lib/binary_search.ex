defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) do
    binary_search(numbers, key, 0, tuple_size(numbers) - 1)
  end

  @spec binary_search(tuple, integer, integer, integer) :: {:ok, integer} | :not_found
  def binary_search(_, _, low, high) when low > high do
    :not_found
  end

  def binary_search(numbers, key, low, high) do
    mid = div(low + high, 2)

    case elem(numbers, mid) do
      val when val == key -> {:ok, mid}
      val when val > key -> binary_search(numbers, key, low, mid - 1)
      _ -> binary_search(numbers, key, mid + 1, high)
    end
  end
end
