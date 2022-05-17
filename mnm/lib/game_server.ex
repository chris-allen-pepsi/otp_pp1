defmodule Mnm.GameServer do
  use GenServer

  alias Mnm.Game

  # Server
  def init(answer) do
    {:ok, Game.new(answer)}
  end

  def handle_cast({:add_guess, guess}, state) do
    {:noreply, Game.add_guess(state, guess)}
  end

  def handle_call(:results, _from, state) do
    {:reply, Game.get_results(state), state}
  end

  # Client
  def start_link(answer) do
    GenServer.start_link(__MODULE__, answer, [name: :game_server])
  end

  def guess(pid \\ :game_server, guess) do
    GenServer.cast(pid, {:add_guess, guess})
  end

  def results(pid \\ :game_server) do
    GenServer.call(pid, :results)
  end
end
