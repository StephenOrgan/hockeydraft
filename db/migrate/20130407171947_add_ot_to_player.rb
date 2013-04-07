class AddOtToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :ot, :integer
  end
end
