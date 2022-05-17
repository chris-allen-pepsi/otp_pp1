defmodule Mnm.GameServer do
  use GenServer

  alias Mnm.Game

  # Server
  def init(answer) do
    {:ok, Game.new(answer)}
  end

  def handle_call({:add_guess, guess}, _from, game) do
    game = Game.add_guess(game, guess)
    {:reply, Game.get_results(game), game}
  end

  # Client
  def start_link(answer) do
    GenServer.start_link(__MODULE__, answer, [name: :game_server])
  end

  def guess(pid \\ :game_server, guess) do
    pid
    |> GenServer.call({:add_guess, guess})
    |> IO.puts()
  end
end
