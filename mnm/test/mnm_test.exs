defmodule MnmTest do
  use ExUnit.Case
  doctest Mnm

  test "greets the world" do
    assert Mnm.hello() == :world
  end
end
