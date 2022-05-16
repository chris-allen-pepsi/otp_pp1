defmodule Sumarr.ServiceTest do
  use ExUnit.Case
  import Sumarr.Service
  require IEx

  describe "start/1" do
    test "should start process" do
      process_id = "24" |> start()
      assert is_pid(process_id)
    end
  end

  describe "inc/1" do
    test "increments counter" do
      process_id = "24" |> start()
      inc(process_id)
      assert "The result is 25." = show(process_id)
    end
  end
end
