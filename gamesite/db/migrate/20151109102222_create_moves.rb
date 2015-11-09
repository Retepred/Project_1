class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.integer :playerid
      t.integer :gameid
      t.integer :square
      t.string :symbol

      t.timestamps null: false
    end
  end
end
