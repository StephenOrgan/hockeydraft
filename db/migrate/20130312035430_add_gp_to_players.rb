class AddGpToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :gp, :integer
  end
end
