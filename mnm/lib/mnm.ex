defmodule Mnm do
  def guess(player_name, guess) do
    Mnm.GameServer.guess(player_name, guess)
  end
end
