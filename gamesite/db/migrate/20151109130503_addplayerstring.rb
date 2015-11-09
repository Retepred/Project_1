class Addplayerstring < ActiveRecord::Migration
  def change
    remove_column :games, :player1, :integer
    remove_column :games, :player2, :integer
    add_column :games, :player1, :string
    add_column :games, :player2, :string
  end
end
