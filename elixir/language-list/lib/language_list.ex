defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove(list) do
    # [_ | tail] = list
    # tail
    tl(list)
  end

  def first([head | _]) do
    # [head | _] = list
    # head
    head
  end

  def count(list) do
    length(list)
  end

  # def functional_list?(list) do
  #   "Elixir" in list
  # end

  def functional_list?([]), do: false
  def functional_list?(["Elixir" | _]), do: true
  def functional_list?([_ | tail]), do: functional_list?(tail)
end
