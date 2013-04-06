class AddGwgToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :gwg, :integer
  end
end
