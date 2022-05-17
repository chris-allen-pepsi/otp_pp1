defmodule Sumarr.Server do
  use GenServer

  alias Sumarr.Counter

  def init(init_arg) do
    {:ok, Counter.new(init_arg)}
  end

  def handle_call(:show, _from, state) do
    {:reply, Counter.message(state), state}
  end

  def handle_cast(:inc, state) do
    {:noreply, Counter.add(state, 1)}
  end

  # The Client API

  def start_link(init_state) do
    GenServer.start_link(__MODULE__, init_state, name: :server)
  end

  def inc(pid \\ :server) do
    GenServer.cast(pid, :inc)
  end

  def show(pid \\ :server) do
    GenServer.call(pid, :show)
  end
end
