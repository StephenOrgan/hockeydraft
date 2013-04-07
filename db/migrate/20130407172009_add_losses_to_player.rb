class AddLossesToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :losses, :integer
  end
end
