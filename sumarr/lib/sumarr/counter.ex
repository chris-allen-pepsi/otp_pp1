defmodule Sumarr.Counter do
  def new(input) do
    %{counter: String.to_integer(input)}
  end

  def add(%{counter: acc}, n) do
    %{counter: acc + n}
  end

  def message(input) do
    "The result is #{input.counter}."
  end
end
