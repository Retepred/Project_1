class AddGameIdToTable < ActiveRecord::Migration
  def change
    add_column :moves, :game_id, :integer
    add_column :moves, :player_id, :integer
  end
end
