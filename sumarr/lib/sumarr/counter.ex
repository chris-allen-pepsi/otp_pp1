defmodule Sumarr.Counter do
  def new(input) do
    String.to_integer(input)
  end

  def add(acc, n) do
    acc + n
  end

  def message(input) do
    "The result is #{input}."
  end
end
