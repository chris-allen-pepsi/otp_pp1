defmodule Mnm.Game do
  @moduledoc """
  Game Rules:

    - An secret answer is generated
    - The answer is 4 marbles long
    - There are 8 different marbles
    - A user gets 10 guess to try to find the answer
    - The guess will be scored providing a red peg for each marble which was in the correct position and correct number.
      A White peg will be displayed for each marble in the wrong position but the correct color.
      Each marble is scored exactly once.
  """
  alias Mnm.Score

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
    Enum.map_join(game.guesses, "\n", fn guess ->
      render_row(game.answer, guess)
    end)
  end

  def render_status(%{answer: answer, guesses: [guess | _]}) when answer == guess, do: "Win!"

  def render_status(%{guesses: guesses}) when length(guesses) >= 10, do: "Lost!"

  def render_status(_game), do: "Playing..."

  defp render_row(answer, guess) do
    ~s<#{Enum.join(guess, " ")} | #{Score.render(answer, guess)}>
  end
end
