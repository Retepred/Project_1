class ArghblargHegh < ActiveRecord::Migration
  def change
    remove_column :games, :player1, :string
    remove_column :games, :player2, :string
    add_column :games, :player1_id, :integer
    add_column :games, :player2_id, :integer
  end
end
