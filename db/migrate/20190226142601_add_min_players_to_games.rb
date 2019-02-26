class AddMinPlayersToGames < ActiveRecord::Migration[5.2]
  def change
    rename_column :games, :nb_player, :nb_player_min
    add_column :games, :nb_player_max, :integer
  end
end
