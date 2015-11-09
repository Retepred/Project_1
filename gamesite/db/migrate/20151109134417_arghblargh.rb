class Arghblargh < ActiveRecord::Migration
  def change
    remove_column :games, :player1, :string
    remove_column :games, :player2, :string
    add_column :games, :player1, :integer
    add_column :games, :player2, :integer
  end
end
