defmodule Sumarr.Service do
  alias Sumarr.Counter

  def start(input) do
    spawn(fn ->
      input
      |> Counter.new()
      |> loop()
    end)
  end

  def inc(counter_pid) do
    send(counter_pid, :inc)
  end

  def show(counter_pid) do
    send(counter_pid, {:show, self()})

    receive do
      message -> message
    end
  end

  def loop(count) do
    count
    |> listen()
    |> loop()
  end

  def listen(count) do
    receive do
      :inc ->
        Counter.add(count, 1)

      {:show, from} ->
        send(from, Counter.message(count))
        count
    end
  end
end
