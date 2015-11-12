class AddWinsTo < ActiveRecord::Migration
  def change
    add_column :users, :wins, :integer
  end
end