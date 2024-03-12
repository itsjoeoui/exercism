defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    8.0 * hourly_rate
  end

  def apply_discount(before_discount, discount) do
    before_discount * (1 - discount / 100.0)
  end

  def monthly_rate(hourly_rate, discount) do
    (22 * daily_rate(hourly_rate)) |> apply_discount(discount) |> ceil
  end

  def days_in_budget(budget, hourly_rate, discount) do
    (budget / ((hourly_rate * 8) |> apply_discount(discount))) |> Float.floor(1)
  end
end
