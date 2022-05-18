defmodule Mnm do
  def new_game(player_name) do
    DynamicSupervisor.start_child(
      :dyn_sup,
      {Mnm.GameServer, name: player_name}
    )
  end

  def guess(player_name, guess) do
    Mnm.GameServer.guess(player_name, guess)
  end
end
