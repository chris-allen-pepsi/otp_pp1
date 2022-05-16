defmodule Sumarr.CounterTest  do
    use ExUnit.Case
    import Sumarr.Counter
    describe "new/1" do
        test "outputs a map with %{counter: integer}" do
            assert %{counter: 42} = new("42")
        end
    end

    describe "add/2" do
        test "adds second argument to current counter value" do
            assert %{counter: 43} = add(%{counter: 42}, 1)
        end
    end

    describe "message/1" do
        test "reports correct message" do
            assert "The result is 43." = message(%{counter: 43})
        end
    end
end
