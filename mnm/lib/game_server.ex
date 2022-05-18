defmodule Mnm.GameServer do
  use GenServer

  alias Mnm.Game

  # Server
  def child_spec(opts) do
    %{
      id: opts[:name] || __MODULE__,
      start: {__MODULE__, :start_link, [opts]}
    }
  end

  def init(:random) do
    init(random_answer())
  end

  def init(answer) do
    {:ok, Game.new(answer)}
  end

  def handle_call({:add_guess, guess}, _from, game) do
    game = Game.add_guess(game, guess)
    {:reply, Game.get_results(game), game}
  end

  # Client
  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts[:answer] || :random, name: opts[:name] || :game_server)
  end

  def guess(pid \\ :game_server, guess) do
    pid
    |> GenServer.call({:add_guess, guess})
    |> IO.puts()
  end

  def random_answer do
    1..8 |> Enum.shuffle() |> Enum.take(4)
  end
end
