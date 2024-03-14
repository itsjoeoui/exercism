defmodule GuessingGame do
  # def compare(_), do: "Make a guess"
  # def compare(_, guess) when not is_number(guess), do: "Make a guess"
  def compare(_, _ \\ :no_guess)
  def compare(_, :no_guess), do: "Make a guess"

  # this is amazing!
  # def compare(secret_number, guess) when secret_number == guess, do: "Correct"
  def compare(secret_number, secret_number), do: "Correct"

  def compare(secret_number, guess) when abs(guess - secret_number) == 1, do: "So close"
  def compare(secret_number, guess) when secret_number > guess, do: "Too low"
  def compare(secret_number, guess) when secret_number < guess, do: "Too high"
end
