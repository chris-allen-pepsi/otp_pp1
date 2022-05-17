defmodule Mnm.Game do
  defstruct [:answer, guesses: []]

  def new(answer) do
    %__MODULE__{answer: answer}
  end

  def add_guess(%{guesses: guesses} = game, guess) do
    %{game | guesses: [guess | guesses]}
  end

  def get_results(game) do
    # iterate each guess
    # compare against answer
    # -- populate Game.GuessResult with matches in correct spot and matches in incorrect spot

    """
    #{render_rows(game)}
    #{render_status(game)}
    """
  end

  def render_rows(game) do
    """
    1 2 3 4 | RRW
    1 2 3 4 | RRW
    1 2 3 4 | RRW
    1 2 3 4 | RRW
    """

  end


  def render_status(%{answer: answer, guesses: [guess | _]}) when answer == guess, do: "Win!"

  def render_status(%{guesses: guesses}) when length(guesses) >= 10, do: "Lost!"

  def render_status(game), do: "Playing..."

  defp evaluate_guess(guess, answer) do

  end
end
