class AdDlimittogameName < ActiveRecord::Migration
  def change
    remove_column :games, :game_name, :string
    add_column :games, :game_name, :string, :limit => 10
  end
end
