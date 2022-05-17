defmodule Mnm.Score do
  defstruct [:wrong_pos, :right_pos]

  def new(answer, guess) do
    correct_pos_count = correct_positions_count(answer, guess)
    wrong_pos_count = Enum.count(answer) - correct_pos_count - miss_count(answer, guess)

    %__MODULE__{
      right_pos: correct_pos_count,
      wrong_pos: wrong_pos_count
    }
  end

  def as_string(%__MODULE__{right_pos: correct, wrong_pos: wrong}) do
    ~s|#{String.duplicate("R", correct)}#{String.duplicate("W", wrong)}|
  end

  def render(answer, guess) do
    answer
    |> new(guess)
    |> as_string()
  end

  defp correct_positions_count(answer, guess) do
    answer
    |> Enum.zip(guess)
    |> Enum.count(fn {answer_val, guess_val} ->
      answer_val == guess_val
    end)
  end

  defp miss_count(answer, guess) do
    Enum.count(guess -- answer)
  end
end
